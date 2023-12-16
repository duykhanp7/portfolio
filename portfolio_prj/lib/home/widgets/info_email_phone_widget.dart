import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_prj/res/res.dart';
import '../../common/common.dart';

class InfoEmailPhoneWidget extends StatefulWidget {
  const InfoEmailPhoneWidget(
      {super.key,
      this.direction = AppDirection.horizontal,
      this.textAlign,
      this.center = false});

  final AppDirection direction;
  final TextAlign? textAlign;
  final bool center;
  @override
  State<InfoEmailPhoneWidget> createState() => _InfoEmailPhoneWidgetState();
}

class _InfoEmailPhoneWidgetState extends State<InfoEmailPhoneWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.direction == AppDirection.vertical
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: infoEmailPhone().addSeperator(const SizedBox(height: 2)),
          )
        : Row(children: infoEmailPhone());
  }

  List<Widget> infoEmailPhone() {
    return [
      AppTextIconButton(
          revert: true,
          childCenter: widget.center,
          textAlign: widget.textAlign,
          onlyTapIcon: true,
          title: '0397439979',
          onTap: () async {
            await Clipboard.setData(const ClipboardData(text: '0397439979'));
            if (!mounted) {
              return;
            }
            context.showMessage('Copy phone successfully!');
          },
          icon: AppIcons.icContentCopy,
          style: AppStyles.menu.copyWith(fontSize: 30)),
      SizedBox(
          width: context.responsive<double>(
              mobile: 10, desktop: 60, tablet: 30, watch: 5)),
      AppTextIconButton(
          revert: true,
          onlyTapIcon: true,
          childCenter: widget.center,
          textAlign: widget.textAlign,
          title: 'duykhangp7@gmail.com',
          onTap: () async {
            await Clipboard.setData(
                const ClipboardData(text: 'duykhangp7@gmail.com'));
            if (!mounted) {
              return;
            }
            context.showMessage('Copy email successfully!');
          },
          icon: AppIcons.icContentCopy,
          style: AppStyles.menu.copyWith(fontSize: 30)),
      SizedBox(
          width: context.responsive<double>(
              mobile: 10, desktop: 60, tablet: 30, watch: 5))
    ];
  }
}
