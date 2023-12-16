import 'package:flutter/material.dart';
import 'package:portfolio_prj/common/common.dart';
import 'package:portfolio_prj/res/app_button.dart';
import 'package:portfolio_prj/res/app_colors.dart';
import 'package:portfolio_prj/res/app_styles.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialButton extends StatefulWidget {
  const SocialButton(
      {super.key,
      required this.index,
      required this.showText,
      required this.len});
  final int index;
  final bool showText;
  final double len;
  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) => ScaleTransition(
        scale: scaleAnimation,
        child: child,
      ),
      child: AppButton(
        size: Size(widget.len, widget.len),
        icon: SocialType.values.elementAt(widget.index).icon,
        iconColor: AppColors.white,
        style: AppStyles.title,
        text: widget.showText
            ? context.isDesktop
                ? null
                : SocialType.values.elementAt(widget.index).title
            : null,
        onTap: () async {
          await launchUrlString(SocialType.values.elementAt(widget.index).url);
        },
        onHover: (hover) {
          if (hover) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
      ),
    );
  }
}
