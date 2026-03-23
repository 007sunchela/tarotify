import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarotify/cubits/page_cubit.dart';
import 'package:tarotify/cubits/theme_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  // элементы меню
  Widget _buildListTile(
    BuildContext context,
    IconData icon,
    String title,
    DrawerPage page,
    DrawerPage currentPage,
    ThemeData theme,
  ) {
    final isSelected = currentPage == page;
    return ListTile(
      leading: Icon(
        icon,
        size: 16,
        color: isSelected ? Colors.pink : theme.colorScheme.onPrimary,
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.pink : theme.colorScheme.onPrimary,
        ),
      ),
      onTap: () {
        context.read<NavigationCubit>().navigateTo(page);
        Navigator.pop(context);
        _navigateToPage(context, page);
      },
    );
  }

  // переход на страницу
  void _navigateToPage(BuildContext context, DrawerPage page) {
    switch (page) {
      case DrawerPage.tarots:
        context.go('/tarots');
        break;
      case DrawerPage.love:
        context.go('/love');
        break;
      case DrawerPage.career:
        context.go('/career');
        break;
      case DrawerPage.finance:
        context.go('/finance');
        break;
      case DrawerPage.fate:
        context.go('/fate');
        break;
      case DrawerPage.settings:
        context.go('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return BlocBuilder<NavigationCubit, DrawerPage>(
          builder: (context, currentPage) {
            return SizedBox(
              width: 240,
              child: Drawer(
                backgroundColor: theme.colorScheme.primary,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/images/icon.png',
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Tarotify',
                              style: GoogleFonts.roboto(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _buildListTile(
                      context,
                      Icons.home,
                      'Карты Таро',
                      DrawerPage.tarots,
                      currentPage,
                      theme,
                    ),
                    _buildListTile(
                      context,
                      Icons.favorite,
                      'Любовь',
                      DrawerPage.love,
                      currentPage,
                      theme,
                    ),
                    _buildListTile(
                      context,
                      Icons.work,
                      'Карьера',
                      DrawerPage.career,
                      currentPage,
                      theme,
                    ),
                    _buildListTile(
                      context,
                      Icons.monetization_on_outlined,
                      'Деньги',
                      DrawerPage.finance,
                      currentPage,
                      theme,
                    ),
                    _buildListTile(
                      context,
                      Icons.casino,
                      'Судьба',
                      DrawerPage.fate,
                      currentPage,
                      theme,
                    ),
                    _buildListTile(
                      context,
                      Icons.settings,
                      'Настройки',
                      DrawerPage.settings,
                      currentPage,
                      theme,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
