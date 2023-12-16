import 'package:flutter/cupertino.dart';
import 'package:portfolio_prj/common/extension/app_ex.dart';
import 'package:portfolio_prj/home/widgets/typing_text_animation.dart';
import '../../res/res.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget(
      {super.key,
      required this.aboutKey,
      required this.avatarListenable,
      required this.introdutionListenable});

  final GlobalKey aboutKey;
  final Listenable avatarListenable;
  final Listenable introdutionListenable;

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
              horizontal: context.width *
                  context.responsive(mobile: 0.05, desktop: 0.1, tablet: 0.1),
              vertical: context.height *
                  context.responsive(mobile: 0.2, tablet: 0.25, desktop: 0.25)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Introduce text
              Expanded(
                child: TypingAnimatedWidget(
                  listenable: widget.introdutionListenable,
                  text:
                      '''Hi there,\nMy name is Duy Khang\nI build things for mobile''',
                ),
              ),

              /// Logo
              Expanded(
                  flex: 1,
                  child: AppCircleAvatar(
                    url: AppImages.avatarBg,
                    listenable: widget.avatarListenable,
                    size: context.responsive(
                        mobile: const Size(180, 180),
                        tablet: const Size(250, 250),
                        desktop: const Size(350, 350)),
                  ))
            ],
          )),
    );
  }
}
