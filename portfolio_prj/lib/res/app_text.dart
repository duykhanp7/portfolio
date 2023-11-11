import 'package:flutter/material.dart';
import 'package:portfolio_prj/common/extension/app_ex.dart';

class AppText extends StatefulWidget {
  const AppText(this.text,
      {super.key, this.style, this.textAlign, this.maxLines, this.child});

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final List<TextSpan>? child;

  @override
  State<AppText> createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
        textScaleFactor: context.responsive<double>(
            mobile: 0.55, tablet: 0.5, desktop: 0.8, watch: 0.5),
        textAlign: widget.textAlign ?? TextAlign.center,
        maxLines: widget.maxLines ?? 5,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: widget.text,
          children: widget.child,
          style: widget.style,
        ));
  }
}
