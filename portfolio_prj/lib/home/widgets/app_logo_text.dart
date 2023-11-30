import 'package:flutter/cupertino.dart';
import 'package:portfolio_prj/home/widgets/gradient_text.dart';
import '../../res/res.dart';

class AppLogoText extends StatefulWidget {
  const AppLogoText({super.key, this.color});
  final List<Color>? color;
  @override
  State<AppLogoText> createState() => _AppLogoTextState();
}

class _AppLogoTextState extends State<AppLogoText> {
  @override
  Widget build(BuildContext context) {
    return GradientText('{007}\npavamng',
        style:
            AppStyles.menu.copyWith(fontSize: 27, fontWeight: FontWeight.w800),
        gradient: LinearGradient(
            colors: widget.color ?? [AppColors.blue, AppColors.pink]));
  }
}
