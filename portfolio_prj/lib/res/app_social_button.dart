import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_prj/res/res.dart';

class AppSocialButton extends StatefulWidget {
  const AppSocialButton({super.key, required this.icon, required this.onClick});

  final String icon;
  final VoidCallback onClick;

  @override
  State<StatefulWidget> createState() => _AppSocialButton();
}

class _AppSocialButton extends State<AppSocialButton> {
  @override
  Widget build(BuildContext context) {
    return AppInkWell(
        onTap: widget.onClick,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(4),
          width: 30,
          height: 30,
          child: SvgPicture.asset(widget.icon),
        ));
  }
}
