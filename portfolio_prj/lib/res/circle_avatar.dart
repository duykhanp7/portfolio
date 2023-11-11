import 'package:flutter/cupertino.dart';
import 'package:portfolio_prj/res/app_colors.dart';
import 'package:portfolio_prj/res/app_images.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({super.key, required this.url, required this.size});
  final String url;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  colors: <Color>[AppColors.avaGraStart, AppColors.avaGraEnd])),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size.height / 2),
            child: Image.asset(
              AppImages.avatar,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ],
    );
  }
}
