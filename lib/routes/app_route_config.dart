import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarotify/intro/intro_page.dart';
import 'package:tarotify/pages/career_page.dart';
import 'package:tarotify/pages/fate_page.dart';
import 'package:tarotify/pages/finance_page.dart';
import 'package:tarotify/pages/love_page.dart';
import 'package:tarotify/pages/settings_page.dart';
import 'package:tarotify/pages/tarots_page.dart';
import 'package:tarotify/routes/app_route_constants.dart';

class MyAppRouter {
  final router = GoRouter(
    initialLocation: '/intro', 
    routes: [
      GoRoute(
        name: MyAppRouteConstants.introRouteName,
        path: '/intro',
        pageBuilder: (context, state) {
          return MaterialPage(child: IntroPage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.tarotsRouteName,
        path: '/tarots',
        pageBuilder: (context, state) {
          return MaterialPage(child: TarotsPage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.loveRouteName,
        path: '/love',
        pageBuilder: (context, state) {
          return MaterialPage(child: LovePage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.careerRouteName,
        path: '/career',
        pageBuilder: (context, state) {
          return MaterialPage(child: CareerPage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.financeRouteName,
        path: '/finance',
        pageBuilder: (context, state) {
          return MaterialPage(child: FinancePage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.fateRouteName,
        path: '/fate',
        pageBuilder: (context, state) {
          return MaterialPage(child: FatePage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.settingsRouteName,
        path: '/settings',
        pageBuilder: (context, state) {
          return MaterialPage(child: SettingsPage());
        },
      ),
    ],
  );
}
