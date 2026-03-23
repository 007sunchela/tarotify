import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:tarotify/cubits/career_close_cubit.dart';
import 'package:tarotify/cubits/career_open_cubit.dart';
import 'package:tarotify/cubits/fate_cubit.dart';
import 'package:tarotify/cubits/finance_close_cubit.dart';
import 'package:tarotify/cubits/finance_open_cubit.dart';
import 'package:tarotify/cubits/love_close_cubit.dart';
import 'package:tarotify/cubits/love_open_cubit.dart';
import 'package:tarotify/cubits/page_cubit.dart';
import 'package:tarotify/cubits/tarots_cubit.dart';
import 'package:tarotify/cubits/theme_cubit.dart';
import 'package:tarotify/db/db_service.dart';
import 'package:tarotify/routes/app_route_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  final db = await AppDatabase.createDatabase();
  final appRouter = MyAppRouter();
  Gemini.init(apiKey: dotenv.env['API_KEY']!);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => NavigationCubit()),
          BlocProvider(create: (_) => TarotsCubit()),
          BlocProvider(create: (_) => TarotsLoveOpenCubit(db)),
          BlocProvider(create: (_) => TarotsLoveCloseCubit(db)),
          BlocProvider(create: (_) => TarotsCareerOpenCubit(db)),
          BlocProvider(create: (_) => TarotsCareerCloseCubit(db)),
          BlocProvider(create: (_) => TarotsFinanceOpenCubit(db)),
          BlocProvider(create: (_) => TarotsFinanceCloseCubit(db)),
          BlocProvider(create: (_) => FateCubit()),
        ],
        child: MyApp(appRouter: appRouter),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final MyAppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          builder: DevicePreview.appBuilder,
          routerConfig: appRouter.router,
          theme: theme,
        );
      },
    );
  }
}
