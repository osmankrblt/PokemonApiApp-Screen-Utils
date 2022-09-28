import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_app/constants/constants.dart';

import '../constants/ui_helper.dart';

class AppBarMyself extends StatefulWidget {
  const AppBarMyself({super.key});

  @override
  State<AppBarMyself> createState() => _AppBarMyselfState();
}

class _AppBarMyselfState extends State<AppBarMyself> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: UIHelper.getDefaultPadding(),
              child: Text(
                Constants.title,
                style: Constants.getTitleTextStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              "assets/images/pokeball.png",
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
