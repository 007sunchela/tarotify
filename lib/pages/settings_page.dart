import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarotify/cubits/theme_cubit.dart';
import 'package:tarotify/themes/light_theme.dart';
import 'package:tarotify/widgets/drawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(
            title: Text(
              'Настройки',
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
          body: Center(
            child: SizedBox(
              width: 300,
              height: 150,
              child: Card(
                elevation: 5,
                color: theme.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Темный режим:',
                        style: TextStyle(
                          fontSize: 18,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Switch(
                        value: theme == lightMode ? false : true,
                        onChanged: (bool newValue) {
                          context.read<ThemeCubit>().toggleTheme();
                        },
                        activeThumbColor: Colors.green,
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.grey[300],
                        activeTrackColor: Colors.green[300],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
