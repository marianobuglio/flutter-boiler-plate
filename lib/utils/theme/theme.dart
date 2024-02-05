
import "package:acomerlapp/utils/theme/custom_theme/appbar_theme.dart";
import "package:acomerlapp/utils/theme/custom_theme/bottom_sheet_theme.dart";
import "package:acomerlapp/utils/theme/custom_theme/checkbox_theme.dart";
import "package:acomerlapp/utils/theme/custom_theme/chip_theme.dart";
import "package:acomerlapp/utils/theme/custom_theme/elevated_button_theme.dart";
import "package:acomerlapp/utils/theme/custom_theme/outlined_button_theme.dart";
import "package:acomerlapp/utils/theme/custom_theme/text_theme.dart";
import "package:flutter/material.dart";

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    chipTheme: TChipTheme.lightChipTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    chipTheme: TChipTheme.darkChipTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme
  );
}