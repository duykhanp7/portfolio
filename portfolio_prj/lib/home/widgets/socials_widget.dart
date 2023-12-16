import 'package:flutter/cupertino.dart';
import 'package:portfolio_prj/common/common.dart';
import 'package:portfolio_prj/home/widgets/social_button.dart';

class SocialWidget extends StatefulWidget {
  const SocialWidget({
    super.key,
    this.direction = AppDirection.horizontal,
    this.mobile,
    this.desktop,
    this.tablet,
    this.watch,
    this.height,
    this.showText = false,
  });
  final AppDirection direction;
  final double? mobile;
  final double? desktop;
  final double? tablet;
  final double? watch;
  final bool showText;
  final double? height;
  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.direction == AppDirection.horizontal
        ? Row(children: socialButton())
        : Column(
            children: socialButton(),
          );
  }

  List<Widget> socialButton() {
    final len = context.responsive<double>(
        mobile: widget.mobile ?? 30,
        desktop: widget.desktop ?? 30,
        tablet: context.isLargeTablet ? 25 : 20,
        watch: widget.watch ?? 10);
    return List.generate(
        SocialType.values.length,
        (index) => SizedBox(
              height: widget.height,
              child: SocialButton(
                index: index,
                len: len,
                showText: widget.showText,
              ),
            ));
  }
}
