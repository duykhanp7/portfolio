import 'package:flutter/cupertino.dart';
import 'package:portfolio_prj/res/app_colors.dart';

class AppCircleAvatar extends AnimatedWidget {
  const AppCircleAvatar(
      {super.key,
      required this.url,
      required this.size,
      required super.listenable});
  final String url;
  final Size size;

  AnimationController get _animationController =>
      listenable as AnimationController;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(
              parent: _animationController,
              curve: Curves.fastLinearToSlowEaseIn)
          .drive(Tween<double>(begin: 0.0, end: 1.0)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.height / 2),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      AppColors.avaGraStart,
                      AppColors.avaGraEnd
                    ])),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size.height / 2),
              child: Image.asset(
                url,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
