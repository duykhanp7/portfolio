import 'package:flutter/cupertino.dart';
import 'package:portfolio_prj/common/extension/app_ex.dart';
import '../../res/res.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key, required this.aboutKey});

  final GlobalKey aboutKey;

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    return context.responsive(
      mobile: Padding(
          key: widget.aboutKey,
          padding: EdgeInsets.symmetric(
              horizontal: context.height *
                  context.responsive(mobile: 0.02, desktop: 0.2, tablet: 0.1),
              vertical: context.width * 0.1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Introduce text
              Expanded(
                flex: 1,
                child: Text.rich(
                    textScaler: TextScaler.linear(context.responsive<double>(
                        mobile: 0.5, tablet: 1, desktop: 1, watch: 0.5)),
                    TextSpan(
                        text: 'Hi👋,',
                        style: AppStyles.header
                            .copyWith(color: AppColors.turple, fontSize: 35),
                        children: [
                          TextSpan(
                              text: '\nMy name is',
                              style: AppStyles.header.copyWith(
                                  color: AppColors.turple, fontSize: 40)),
                          TextSpan(
                              text: '\nDuy Khang',
                              style: AppStyles.header.copyWith(
                                  fontSize: 40,
                                  foreground: Paint()
                                    ..shader = const LinearGradient(
                                      colors: <Color>[
                                        AppColors.blue,
                                        AppColors.pink
                                      ],
                                    ).createShader(const Rect.fromLTWH(
                                        0.0, 0.0, 200.0, 70.0)))),
                          TextSpan(
                              text: '\nI build things for mobile',
                              style: AppStyles.header.copyWith(
                                  color: AppColors.turple, fontSize: 40))
                        ])),
              ),

              /// Logo
              Expanded(
                  flex: 1,
                  child: AppCircleAvatar(
                      url: AppImages.avatar,
                      size: context.responsive(
                          mobile: const Size(180, 180),
                          tablet: const Size(250, 250),
                          desktop: const Size(350, 350))))
            ],
          )),
    );
  }
}
