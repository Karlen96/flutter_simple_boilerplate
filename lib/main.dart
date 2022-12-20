import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'consts/assets.dart';
import 'consts/configs.dart';
import 'consts/env_type.dart';
import 'http/dio.dart';
import 'routes/router.dart';
import 'theme/light_theme.dart';
import 'utils/load_json.dart';

Future<void> main() async {
  await run();
}

Future<void> run({EnvType env = EnvType.DEV}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      useOnlyLangCode: true,
      startLocale: const Locale('en'),
      useFallbackTranslations: true,
      path: Assets.translations,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}

Future<void> setConfigs() async {
  final config = await loadJson(Assets.devEnv);

  ConfigsEntity.baseUrl = config['baseUrl'] as String;
  ConfigsEntity.apiKey = config['apiKey'] as String;
  ConfigsEntity.baseImage = config['baseImage'] as String;
  setDio();
}
