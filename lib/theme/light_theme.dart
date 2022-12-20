import 'package:flutter/material.dart';

import '../consts/app_colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.lightGray,
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.lightGray,
    ),
    bodyText2: TextStyle(
      fontSize: 20,
      color: AppColors.dark,
    ),
    bodyText1: TextStyle(
      fontSize: 24,
      color: AppColors.dark,
    ),
  ),
);
