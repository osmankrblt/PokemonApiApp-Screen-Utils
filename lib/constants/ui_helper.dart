import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static EdgeInsets getDefaultPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(12.h);
    } else {
      return EdgeInsets.all(8.w);
    }
  }

  static EdgeInsets getDetailChipPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(25.h);
    } else {
      return EdgeInsets.all(20.w);
    }
  }

  static int getCardLength() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return (ScreenUtil().screenWidth / 200.w).toInt();
    } else {
      return (ScreenUtil().screenHeight / 200.h).toInt();
    }
  }

  static double calculatePokeImgAndBallSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 0.2.sw;
    } else {
      return 0.3.sh;
    }
  }

  static getColorFromType(String type) {
    if (type == "Grass") {
      return Colors.green.shade400;
    } else if (type == "Fire") {
      return Colors.red;
    } else if (type == "Ground") {
      return Colors.brown;
    } else if (type == "Bug") {
      return Colors.brown.shade800;
    } else if (type == "Ground") {
      return Colors.brown;
    } else if (type == "Ghost") {
      return Colors.white;
    } else if (type == "Water") {
      return Colors.blue;
    } else if (type == "Poison") {
      return Colors.purple.shade800;
    } else if (type == "Normal") {
      return Colors.grey;
    } else {
      return Colors.black;
    }
  }

  static listToStr(list) {
    if (list is String) {
      return list;
    } else if (list is List) {
      return list.join(", ").toString();
    } else {
      return "Null";
    }
  }
}
