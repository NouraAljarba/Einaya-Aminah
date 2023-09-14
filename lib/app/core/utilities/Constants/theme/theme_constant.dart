import 'package:einayaaminah/app/core/utilities/Constants/colors.dart';
import 'package:einayaaminah/app/core/utilities/Shared/Text%20Components/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appThemes(BuildContext context, bool isDark) {
  //mode light theme
  ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
        titleLarge: GoogleFonts.poiretOne(
          fontSize: AppSizes.headLineSize(context),
        ),
        titleMedium:
            GoogleFonts.kameron(fontSize: AppSizes.subHeadSize(context)),
        bodyMedium:
            GoogleFonts.kameron(fontSize: AppSizes.bodyTextSize(context)),
        labelLarge:
            GoogleFonts.kameron(fontSize: AppSizes.buttonTextSize(context))),
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimeryColor,
    appBarTheme: const AppBarTheme(foregroundColor: Colors.black),
    scaffoldBackgroundColor: AppColors.lightBGColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightPrimeryColor),
    iconTheme: IconThemeData(color: AppColors.lightSecondryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkBlack,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );

  //mode dark theme
  ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
        titleLarge: GoogleFonts.poiretOne(
          fontSize: AppSizes.headLineSize(context),
        ),
        titleMedium:
            GoogleFonts.kameron(fontSize: AppSizes.subHeadSize(context)),
        bodyMedium:
            GoogleFonts.kameron(fontSize: AppSizes.bodyTextSize(context)),
        labelLarge:
            GoogleFonts.kameron(fontSize: AppSizes.buttonTextSize(context))),
    brightness: Brightness.dark,
    primaryColor: AppColors.lightPrimeryColor,
    appBarTheme: const AppBarTheme(foregroundColor: Colors.white),
    scaffoldBackgroundColor: AppColors.darkBGColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightPrimeryColor),
    iconTheme: IconThemeData(color: AppColors.lightSecondryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkBlack,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );

  if (!isDark) {
    return lightTheme;
  } else {
    return darkTheme;
  }
}
