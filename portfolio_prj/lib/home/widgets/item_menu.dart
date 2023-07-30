import 'package:flutter/cupertino.dart';
import 'package:portfolio_prj/res/res.dart';

import 'gradient_text.dart';

class ItemMenu extends StatefulWidget {
  const ItemMenu({super.key, required this.title, required this.onClick});
  final String title;
  final VoidCallback onClick;

  @override
  State<StatefulWidget> createState() => _ItemMenu();
}

class _ItemMenu extends State<ItemMenu> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final paint = Paint()
      ..shader =
          const LinearGradient(colors: <Color>[AppColors.blue, AppColors.pink])
              .createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return AppInkWell(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
            child: Container(
              alignment: Alignment.center,
              child: GradientText(widget.title,
                  style: AppStyles.menu
                      .copyWith(foreground: isHover ? paint : null),
                  gradient: const LinearGradient(
                      colors: [AppColors.blue, AppColors.pink])),
              // child: Text(widget.title,
              //     style: AppStyles.menu
              //         .copyWith(foreground: isHover ? paint : null))
            )),
        onTap: () {},
        onHover: (hover) {
          setState(() {
            isHover = hover;
          });
        });
  }
}
