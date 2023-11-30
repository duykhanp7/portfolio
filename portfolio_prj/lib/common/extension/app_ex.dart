import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio_prj/res/app_colors.dart';
import 'package:portfolio_prj/res/app_styles.dart';

extension AppContext on BuildContext {
  T responsive<T>({T? desktop, T? tablet, required T mobile, T? watch}) {
    final double width = MediaQuery.of(this).size.width;

    if (desktop != null && width >= 1200) {
      return desktop;
    } else if (tablet != null && width >= 600) {
      return tablet;
    } else if (watch != null && width < 300) {
      return watch;
    }
    return mobile;
  }

  String screenOf<T>() {
    final double width = MediaQuery.of(this).size.width;

    if (width >= 1200) {
      return 'Desktop $width';
    } else if (width >= 720) {
      return 'Large Tablet $width';
    } else if (width >= 600) {
      return 'Small Tablet $width';
    } else if (width < 300) {
      return 'Watch $width';
    }
    return 'Mobile $width';
  }

  Size get size => MediaQuery.sizeOf(this);

  void scrollTo(BuildContext context) => Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 2),
        curve: Curves.linearToEaseOut,
      );

  void pop<T>([T? result]) => Navigator.of(this).pop(result);

  FToast get initFToast => FToast().init(this);

  void showMessage(String message) => initFToast.showToast(
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: const Offset(1, 1),
              color: AppColors.black.withOpacity(0.1),
            ),
            BoxShadow(
              offset: const Offset(-1, -1),
              color: AppColors.black.withOpacity(0.1),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(message,
            style: AppStyles.title.copyWith(
                fontSize: 15,
                color: AppColors.black,
                decorationStyle: TextDecorationStyle.dashed)),
      ),
      gravity:
          isDesktop || isTablet ? ToastGravity.TOP_RIGHT : ToastGravity.BOTTOM);

  bool get isMobile => size.width < 600;
  bool get isDesktop => size.width >= 1200;
  bool get isTablet => size.width >= 600 && size.width < 1200;
  bool get isWatch => size.width < 300;
  bool get isLargeTablet => size.width >= 720 && size.width < 1200;
  bool get isSmallTablet => size.width >= 600 && size.width < 720;

  double get width => size.width;
  double get height => size.height;
}
