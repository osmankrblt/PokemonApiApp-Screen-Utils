import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String title = "Pokedex";
  static String pokeBallImageUrl = "assets/images/pokeball.png";
  static TextStyle getTitleTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(48), fontWeight: FontWeight.bold);
  }

  static TextStyle getDetailLabelTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(25),
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static TextStyle getDetailValueTextSyle() {
    return TextStyle(
        fontSize: _calculateFontSize(20),
        fontWeight: FontWeight.normal,
        color: Colors.black);
  }

  static TextStyle getPokemonTypeChipTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(20), color: Colors.white);
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(30),
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static getIconButtonSize(size) {
    return _calculateFontSize(size);
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 0.5).sp;
    }
  }
}
