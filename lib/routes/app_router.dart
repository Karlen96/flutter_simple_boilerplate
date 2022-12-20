import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/splash_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  preferRelativeImports: true,
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute(
      page: SplashPage,
      initial: true,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
