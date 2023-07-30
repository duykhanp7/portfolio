import 'package:flutter/material.dart';
import 'package:portfolio_prj/home/widgets/app_appbar.dart';
import 'package:portfolio_prj/res/app_images.dart';
import 'package:portfolio_prj/res/res.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(150, 41, 0, 0),
          child: Column(
            children: [_buildIntroductionWidget()],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroductionWidget() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Row(
          children: [
            Text.rich(TextSpan(
                text: 'Hi👋,',
                style: AppStyles.header
                    .copyWith(color: AppColors.turple, fontSize: 45),
                children: [
                  TextSpan(
                      text: '\nMy name is',
                      style: AppStyles.header
                          .copyWith(color: AppColors.turple, fontSize: 48)),
                  TextSpan(
                      text: '\nDuy Khang',
                      style: AppStyles.header.copyWith(
                          fontSize: 48,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: <Color>[AppColors.blue, AppColors.pink],
                            ).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)))),
                  TextSpan(
                      text: '\nI build things for mobile',
                      style: AppStyles.header
                          .copyWith(color: AppColors.turple, fontSize: 48))
                ])),
            const SizedBox(width: 220),
            const AppCircleAvatar(url: AppImages.avatar, size: Size(350, 350))
          ],
        ));
  }
}
