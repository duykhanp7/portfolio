import 'package:flutter/material.dart';
import 'package:portfolio_prj/res/res.dart';

class ItemMenu extends StatefulWidget {
  const ItemMenu(
      {super.key,
      required this.title,
      required this.onTap,
      this.color,
      this.fontSize});
  final String title;
  final VoidCallback onTap;
  final List<Color>? color;
  final double? fontSize;

  @override
  State<StatefulWidget> createState() => _ItemMenu();
}

class _ItemMenu extends State<ItemMenu> with SingleTickerProviderStateMixin {
  bool isHover = false;

  late AnimationController _animationController;
  late Animation<double> scaleTween;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    scaleTween = CurvedAnimation(
            parent: _animationController, curve: Curves.fastLinearToSlowEaseIn)
        .drive(Tween<double>(begin: 1.0, end: 0.9));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
        onTap: widget.onTap,
        onHover: (hover) {
          setState(() {
            isHover = hover;
          });
          if (hover) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        },
        child: AnimatedBuilder(
          animation: scaleTween,
          builder: (context, child) => ScaleTransition(
            scale: scaleTween,
            child: child,
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
              child: Container(
                alignment: Alignment.center,
                child: AppText(
                  widget.title,
                  style: AppStyles.menu.copyWith(fontSize: widget.fontSize),
                ),
              )),
        ));
  }
}
