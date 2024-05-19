

import 'package:flutter/material.dart';


import 'custom_theme/app_bar_theme.dart';
import 'custom_theme/buttom_sheet_thee.dart';
import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outline_button_theme.dart';
import 'custom_theme/text_field_theme.dart';
import 'custom_theme/text_theme.dart';

class AppTheme{
  AppTheme._();
  static ThemeData lightTheme=ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue ,
    scaffoldBackgroundColor: Colors.white,
    textTheme:TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
      bottomSheetTheme:TButtomSheetTheme.lightButtomSheetTheme,
      checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
      chipTheme: TChipTheme.lightChipTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme=ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue ,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme:TButtomSheetTheme.darkButtomSheetTheme ,
  checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
      chipTheme: TChipTheme.darkChipTheme ,
    outlinedButtonTheme: TOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme:TTextFormFieldTheme.darkInputDecorationTheme,
  );

}
