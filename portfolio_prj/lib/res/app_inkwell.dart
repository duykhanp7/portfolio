import 'package:flutter/material.dart';
import 'package:portfolio_prj/res/res.dart';

class AppInkWell extends StatefulWidget {
  const AppInkWell(
      {super.key,
      required this.child,
      required this.onTap,
      this.onHover,
      this.onFocusChange});
  final Widget child;
  final VoidCallback onTap;
  final Function(bool)? onHover;
  final Function(bool)? onFocusChange;

  @override
  State<StatefulWidget> createState() => _AppInkWell();
}

class _AppInkWell extends State<AppInkWell> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          splashColor: AppColors.splash.withOpacity(0.1),
          borderRadius: BorderRadius.circular(Dimens.borderRadius),
          highlightColor: AppColors.white.withOpacity(0.5),
          onTap: widget.onTap,
          onHover: (hover) {
            setState(() {
              isHover = hover;
              if (widget.onHover != null) {
                widget.onHover!(hover);
              }
            });
          },
          onFocusChange: widget.onFocusChange,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.borderRadius),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
