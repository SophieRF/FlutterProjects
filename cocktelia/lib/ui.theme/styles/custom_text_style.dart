import 'package:flutter/material.dart';
import 'package:cocktelia/ui.theme/size_app.dart';

class AppTextStyle{

  TextStyle? h132;
  TextStyle? h120;
  TextStyle? paragraph24;
  TextStyle? paragraph24Dark;

  AppTextStyle({
    required this.h120,
    required this.h132, 
    required this.paragraph24,
    required this.paragraph24Dark});

    factory AppTextStyle.textStyles(){
      return AppTextStyle(
        h120:_styleMichroma.copyWith(
          fontSize: sizeTextH120,
          fontWeight: FontWeight.bold,
          ) , 
        h132:_styleMichroma.copyWith(fontSize: sizeTextH132, 
          shadows: [
            const Shadow(
              blurRadius: 4.0,
              color: Colors.black,
              offset: Offset(4.0, 4.0),)]
        ), 
        paragraph24:_styleSairaExtraCondensed.copyWith(
          fontSize: sizeTextParagraph24, 
          color: Colors.white),
        paragraph24Dark: _styleSairaExtraCondensed.copyWith(
          fontSize: sizeTextParagraph24, 
          color: Colors.black87,
          fontWeight: FontWeight.bold),
        );
    }

  static TextStyle get _styleBahianita => const TextStyle(
    fontFamily: 'Bahianita-Regular',
    color: Colors.white,
  );
  static TextStyle get _styleGoldman => const TextStyle(
    fontFamily: 'Goldman-Regular',
    color: Colors.white,
  );
  static TextStyle get _styleLobsterTwo => const TextStyle(
    fontFamily: 'LobsterTwo-Regular',
    color: Colors.white,
  );
  static TextStyle get _styleMichroma => const TextStyle(
    fontFamily: 'Michroma-Regular',
    color: Colors.white,
  );
  static TextStyle get _styleOdibeeSans => const TextStyle(
    fontFamily: 'OdibeeSans-Regular',
    color: Colors.white,
  );
  static TextStyle get _styleSairaExtraCondensed => const TextStyle(
    fontFamily: 'SairaExtraCondensed-Regular',);
}
