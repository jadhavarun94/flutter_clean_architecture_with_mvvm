import 'package:course_clean_architecture_with_mvvm/presentation/resources/color_manager.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/resources/font_manager.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/resources/style_manager.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(

      //Main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      splashColor: ColorManager.primaryOpacity70,
      disabledColor: ColorManager.grey1,
      //will be used in case of disabled button for example

      //Card view theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),

      //App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          shadowColor: ColorManager.primaryOpacity70,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s16)),
      //Button theme
      buttonTheme: ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.primaryOpacity70),

      //Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
              color: ColorManager.white,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppPadding.p12))),
      ),
      //Text theme
      textTheme: TextTheme(
          headline1: getRegularStyle(
              color: ColorManager.darkGrey, fontSize: FontSize.s16),
          subtitle1:
              getMediumStyle(color: ColorManager.light, fontSize: FontSize.s14),
          subtitle2: getMediumStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
          caption: getRegularStyle(color: ColorManager.grey1),
          bodyText1: getRegularStyle(color: ColorManager.grey)),

      //Input decoration theme(text form field)

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularStyle(color: ColorManager.grey1),
        labelStyle: getMediumStyle(color: ColorManager.darkGrey),
        errorStyle: getRegularStyle(color: ColorManager.error),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        //Focused border
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        //error border
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
      ));
}
