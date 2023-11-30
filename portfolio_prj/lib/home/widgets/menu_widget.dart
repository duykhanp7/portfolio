import 'package:flutter/material.dart';

import '../../common/common.dart';
import 'item_menu.dart';


class MenuWidget extends StatefulWidget {
  const MenuWidget(
      {super.key,
      this.direction = AppDirection.horizontal,
      this.height,
      this.fontSize,
      required this.onTap});
  final AppDirection direction;
  final double? height;
  final double? fontSize;
  final Function(MenuCategory category) onTap;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.direction == AppDirection.horizontal
        ? Row(
            children: _menus(),
          )
        : Column(
            children: _menus(),
          );
  }

  List<Widget> _menus() {
    return List.generate(
        MenuCategory.values.length,
        (index) => SizedBox(
              height: widget.height,
              child: ItemMenu(
                  fontSize: widget.fontSize,
                  color: const [Color(0XFF42446E), Color(0XFF42446E)],
                  title: MenuCategory.values.elementAt(index).title,
                  onTap: () {
                    widget.onTap(MenuCategory.values.elementAt(index));
                  }),
            )).addSeperator(SizedBox(
        width:
            context.responsive(mobile: 5, desktop: 30, tablet: 5, watch: 0)));
  }
}
