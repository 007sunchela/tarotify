import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:tarotify/cubits/fate_cubit.dart';
import 'package:tarotify/cubits/theme_cubit.dart';
import 'package:tarotify/utility/error_pdf.dart';
import 'package:tarotify/utility/error_permission.dart';
import 'package:tarotify/utility/save_pdf.dart';
import 'package:tarotify/utility/select_date.dart';
import 'package:tarotify/widgets/drawer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

class FatePage extends StatefulWidget {
  const FatePage({super.key});

  @override
  State<FatePage> createState() => _FatePageState();
}

class _FatePageState extends State<FatePage> {
  DateTime? selectedDate;
  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<FateCubit>(context);
    cubit.reset();
  }

  // открыть календарь
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // сохранить отчет
  Future<void> saveResume(String text) async {
    PermissionStatus status = await Permission.manageExternalStorage.request();
    if (!status.isGranted) {
      if (mounted) {
        showErrorPermission(context);
      }
      return;
    }

    try {
      late String downloadDirectory;
      if (Platform.isAndroid) {
        downloadDirectory = '/storage/emulated/0/Download';
      } else if (Platform.isIOS) {
        downloadDirectory =
            '/var/mobile/Containers/Data/Application/<UUID>/Documents';
      }

      String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      String filePath = '$downloadDirectory/report_$timestamp.pdf';

      while (await File(filePath).exists()) {
        timestamp = DateTime.now().millisecondsSinceEpoch.toString();
        filePath = '$downloadDirectory/report_$timestamp.pdf';
      }

      final ByteData fontData = await rootBundle.load(
        'assets/fonts/Roboto-Regular.ttf',
      );
      final font = pw.Font.ttf(fontData);

      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Text(
                text,
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                  font: font,
                ),
              ),
            );
          },
        ),
      );

      final File file = File(filePath);
      await file.writeAsBytes(await pdf.save());
      if (mounted) {
        savePdf(context);
      }
    } catch (e) {
      if (mounted) {
        showErrorPdf(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(
            title: Text(
              'Судьба',
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            centerTitle: true,
            backgroundColor: theme.colorScheme.primary,
          ),
          drawer: AppDrawer(),
          body: BlocBuilder<FateCubit, FateState>(
            builder: (context, state) {
              if (state is FateLoading) {
                return Center(child: Image.asset('assets/images/loading.gif'));
              } else if (state is FateLoaded) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          state.result,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () => selectDate(context),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: theme.colorScheme.onPrimary,
                            fixedSize: Size(250, 50),
                            backgroundColor: theme.colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            selectedDate == null
                                ? 'Выберите дату рождения'
                                : '${selectedDate!.toLocal()}'.split(' ')[0],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () {
                            if (selectedDate != null) {
                              context.read<FateCubit>().loadResult(
                                '${selectedDate!.toLocal()}'.split(' ')[0],
                              );
                            } else {
                              showErrorDate(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: theme.colorScheme.onPrimary,
                            fixedSize: Size(250, 50),
                            backgroundColor: theme.colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Получить предсказание',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () {
                            saveResume(state.result);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: theme.colorScheme.onPrimary,
                            fixedSize: Size(250, 50),
                            backgroundColor: theme.colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Сохранить отчет',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is FateError) {
                return Center(
                  child: Text(
                    'Ошибка: ${state.message}',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => selectDate(context),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: theme.colorScheme.onPrimary,
                        fixedSize: Size(250, 50),
                        backgroundColor: theme.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        selectedDate == null
                            ? 'Выберите дату рождения'
                            : '${selectedDate!.toLocal()}'.split(' ')[0],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedDate != null) {
                            context.read<FateCubit>().loadResult(
                              '${selectedDate!.toLocal()}'.split(' ')[0],
                            );
                          } else {
                            showErrorDate(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: theme.colorScheme.onPrimary,
                          fixedSize: Size(250, 50),
                          backgroundColor: theme.colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Получить предсказание',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
