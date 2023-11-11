import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_prj/res/res.dart';

class AppButton extends StatefulWidget {
  const AppButton(
      {super.key,
      required this.icon,
      this.size,
      this.iconColor,
      this.text,
      required this.onTap,
      this.style});

  final String icon;
  final Size? size;
  final Color? iconColor;
  final String? text;
  final VoidCallback onTap;
  final TextStyle? style;
  @override
  State<StatefulWidget> createState() => _AppButton();
}

class _AppButton extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    final icon = SvgPicture.asset(
      widget.icon,
      alignment: Alignment.centerRight,
      color: widget.iconColor,
      width: widget.size?.width ?? 30,
      height: widget.size?.height ?? 30,
    );
    return AppInkWell(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(4),
          child: widget.text == null
              ? icon
              : Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: icon),
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Row(
                            children: [
                              const SizedBox(width: 5),
                              AppText(widget.text ?? '', style: widget.style)
                            ],
                          ))
                    ])
                  ],
                ),
        ));
  }
}
