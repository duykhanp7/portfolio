import 'package:flutter/material.dart';
import 'package:portfolio_prj/common/common.dart';
import 'package:portfolio_prj/res/app_colors.dart';
import 'package:portfolio_prj/res/app_styles.dart';

class TypingTween extends Tween<String> {
  TypingTween({String begin = '', String end = ''})
      : super(begin: begin, end: end);

  @override
  String lerp(double t) {
    return end!.substring(0, (end!.length * t).round());
  }
}

class TypingAnimatedWidget extends AnimatedWidget {
  const TypingAnimatedWidget({
    super.key,
    required super.listenable,
    required this.text,
  });

  final String text;

  AnimationController get _controller => listenable as AnimationController;

  Animation<String> get animation1 =>
      CurvedAnimation(parent: _controller, curve: const Interval(0, 1 / 4))
          .drive(TypingTween(begin: '', end: 'Hi there\n'));

  Animation<String> get animation2 => CurvedAnimation(
          parent: _controller, curve: const Interval(1 / 4, 1.5 / 4))
      .drive(TypingTween(begin: '', end: 'My name is'));

  Animation<String> get animation3 => CurvedAnimation(
          parent: _controller, curve: const Interval(1.5 / 4, 2 / 4))
      .drive(TypingTween(begin: '', end: ' Duy Khang\n'));

  Animation<String> get animation4 =>
      CurvedAnimation(parent: _controller, curve: const Interval(2 / 4, 3 / 4))
          .drive(TypingTween(begin: '', end: 'I build the things for mobile'));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   animation1.value,
        //   textAlign: TextAlign.left,
        //   style:
        //       AppStyles.header.copyWith(color: AppColors.turple, fontSize: 40),
        // ),
        // Text.rich(TextSpan(children: [
        //   TextSpan(
        //     text: animation2.value,
        //     style: AppStyles.header
        //         .copyWith(color: AppColors.turple, fontSize: 40),
        //   ),
        //   TextSpan(
        //     text: animation3.value,
        //     style: AppStyles.header.copyWith(
        //         fontSize: 40,
        //         foreground: Paint()
        //           ..shader = const LinearGradient(
        //             colors: <Color>[AppColors.blue, AppColors.pink],
        //           ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
        //   ),
        // ])),
        // Text(
        //   animation4.value,
        //   textAlign: TextAlign.left,
        //   style:
        //       AppStyles.header.copyWith(color: AppColors.turple, fontSize: 40),
        // ),
        //////////////////
        Text.rich(
            textScaler: TextScaler.linear(context.responsive<double>(
                mobile: 0.5, tablet: 1, desktop: 1, watch: 0.5)),
            TextSpan(
                text: animation1.value,
                style: AppStyles.header
                    .copyWith(color: AppColors.white, fontSize: 40),
                children: [
                  TextSpan(
                      text: animation2.value,
                      style: AppStyles.header
                          .copyWith(color: AppColors.white, fontSize: 40),
                      children: [
                        TextSpan(
                            text: animation3.value,
                            style: AppStyles.header.copyWith(
                                fontSize: 40,
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    colors: <Color>[
                                      AppColors.turple,
                                      AppColors.blue,
                                      AppColors.pink
                                    ],
                                  ).createShader(const Rect.fromLTWH(
                                      0.0, 0.0, 200.0, 70.0))))
                      ]),
                  TextSpan(
                      text: animation4.value,
                      style: AppStyles.header
                          .copyWith(color: AppColors.white, fontSize: 40))
                ]))
      ],
    );
  }
}
