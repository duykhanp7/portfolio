import 'package:flutter/material.dart';
import 'package:portfolio_prj/home/widgets/widget.dart';

import '../../common/common.dart';
import '../../res/res.dart';


class ContactWidget extends StatefulWidget {
  const ContactWidget(
      {super.key, required this.onTap, required this.contactKey});

  final Function(MenuCategory category) onTap;
  final GlobalKey contactKey;

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      key: widget.contactKey,
      padding: EdgeInsets.only(
        left: context.isDesktop ? 80 : 30,
        right: context.isDesktop ? 80 : 30,
        bottom: 100,
      ),
      child: context.isDesktop
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppLogoText(),
                    Spacer(),
                    InfoEmailPhoneWidget(direction: AppDirection.horizontal),
                    SocialWidget(mobile: 15, tablet: 20, desktop: 28),
                  ],
                ),
                const SizedBox(height: 60),
                const Divider(height: 2, color: AppColors.brown),
                const SizedBox(height: 60),
                Row(
                  children: [
                    MenuWidget(
                      direction: AppDirection.horizontal,
                      fontSize: 25,
                      onTap: widget.onTap,
                    ),
                    const Spacer(),
                    ...textOwener(fontSize: 25),
                  ],
                )
              ],
            )
          : Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        const AppLogoText(),
                        MenuWidget(
                          direction: AppDirection.vertical,
                          onTap: widget.onTap,
                        ),
                      ],
                    )),
                    const Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: true,
                          child: AppLogoText(
                              color: [Colors.transparent, Colors.transparent]),
                        ),
                        InfoEmailPhoneWidget(
                            direction: AppDirection.vertical,
                            textAlign: TextAlign.center,
                            center: true),
                        SocialWidget(
                            direction: AppDirection.vertical,
                            mobile: 15,
                            tablet: 20,
                            desktop: 28,
                            showText: true),
                      ],
                    )),
                  ],
                ),
                SizedBox(
                    height: context.responsive<double>(
                        mobile: 20, tablet: 30, desktop: 50, watch: 5)),
                const Divider(height: 2, color: AppColors.brown),
                SizedBox(
                    height: context.responsive<double>(
                        mobile: 20, tablet: 30, desktop: 50, watch: 5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: textOwener(fontSize: 25),
                )
              ],
            ),
    );
  }

  List<Widget> textOwener({bool textAuth = true, double fontSize = 20}) {
    return [
      textAuth
          ? AppText('Designed and built by ',
              style: AppStyles.menu.copyWith(fontSize: fontSize))
          : Container(),
      Expanded(
        child: GradientText('Khang Pham',
            alignment: TextAlign.left,
            style: AppStyles.menu.copyWith(fontSize: fontSize),
            gradient:
                const LinearGradient(colors: [AppColors.blue, AppColors.pink])),
      )
    ];
  }
}
