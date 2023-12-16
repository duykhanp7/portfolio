import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_prj/common/extension/app_ex.dart';
import 'package:portfolio_prj/res/res.dart';

class AppTextIconButton extends StatefulWidget {
  const AppTextIconButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon,
      required this.style,
      this.revert = false,
      this.onlyTapIcon = false,
      this.textAlign = TextAlign.center,
      this.childCenter = false});

  final String title;
  final String icon;
  final VoidCallback onTap;
  final TextStyle style;
  final bool revert;
  final bool onlyTapIcon;
  final TextAlign? textAlign;
  final bool childCenter;

  @override
  State<AppTextIconButton> createState() => _AppTextIconButtonState();
}

class _AppTextIconButtonState extends State<AppTextIconButton> {
  @override
  Widget build(BuildContext context) {
    final len = context.responsive<double>(mobile: 20, desktop: 25, tablet: 15);

    final icon = SvgPicture.asset(
      widget.icon,
      fit: BoxFit.cover,
      width: len,
      height: len,
      color: Colors.white,
    );

    List<Widget> list = [
      widget.onlyTapIcon
          ? InkWell(
              onTap: widget.onTap,
              splashColor: AppColors.white.withOpacity(0.5),
              child: icon)
          : icon,
      const SizedBox(width: 10),
      AppText(
        widget.title,
        style: widget.style,
        maxLines: 5,
        textAlign: widget.textAlign,
      )
    ];

    if (widget.revert) {
      list = list.reversed.toList();
    }

    final children = Row(
      mainAxisAlignment: widget.childCenter
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: list,
    );

    final child = widget.onlyTapIcon
        ? children
        : InkWell(
            onTap: widget.onTap,
            splashColor: AppColors.white.withOpacity(0.5),
            child: children,
          );

    return Material(
      color: Colors.transparent,
      child: child,
    );
  }
}
