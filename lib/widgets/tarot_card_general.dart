import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarotify/cubits/theme_cubit.dart';

class TarotCardWidget extends StatelessWidget {
  final String url;
  final String name;
  final String desc;
  final int value;
  final String meanOne;
  final String meanTwo;
  final int idType;
  final int? idSuit;

  const TarotCardWidget({
    super.key,
    required this.url,
    required this.name,
    required this.desc,
    required this.value,
    required this.meanOne,
    required this.meanTwo,
    required this.idType,
    required this.idSuit,
  });

  @override
  Widget build(BuildContext context) {
    String cardType = idType == 1 ? 'Старший Аркан' : 'Младший Аркан';

    String suitName = '';
    if (idSuit != null) {
      switch (idSuit) {
        case 1:
          suitName = 'Жезлы';
          break;
        case 2:
          suitName = 'Кубки';
          break;
        case 3:
          suitName = 'Мечи';
          break;
        case 4:
          suitName = 'Пентакли';
          break;
        default:
          suitName = '';
      }
    }



    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return FlipCard(
          direction: FlipDirection.VERTICAL,
          front: SizedBox(
            width: 100,
            height: 300,
            child: Card(
              color: theme.colorScheme.primary,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      url,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
          back: SizedBox(
            width: 100,
            height: 300,
            child: Card(
              color: theme.colorScheme.primary,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Название: ',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                    Text(
                      name,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(height: 10),

                    Text(
                      'Тип карты: ',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                    Text(
                      cardType,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(height: 10),

                    if (suitName.isNotEmpty) ...[
                      Text(
                        'Масть карты: ',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                      Text(
                        suitName,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                    const SizedBox(height: 10),

                    Text(
                      'Номер карты: ',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                    Text(
                      value.toString(),
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(height: 10),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Прямой смысл:',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(meanOne),
                            const SizedBox(height: 10),
                            Text(
                              'Переносный смысл:',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(meanTwo),
                            const SizedBox(height: 10),
                            Text(
                              'Интерпретация:',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(desc),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
