import 'package:flutter/cupertino.dart';
import 'package:to_do_list_app/ui/themes/app_colors.dart';

class TextStyles {
  static const appBarTitle = TextStyle(
    fontSize: 22,
    color: AppColors.textColor,
    height: 1.27,
    fontWeight: FontWeight.normal,
  );
  static const noteTitle = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
    height: 1.18,
    fontWeight: FontWeight.normal,
  );
  static const noteTime = TextStyle(
    fontSize: 14,
    color: AppColors.timeColor,
    height: 1.42,
    fontWeight: FontWeight.w500,
  );
  static const noteStyle = TextStyle(
    fontSize: 14,
    color: AppColors.lightDarkColor,
    height: 1.14,
  );
}
