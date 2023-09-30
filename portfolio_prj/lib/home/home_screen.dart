import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_prj/common/extension/enum_languages.dart';
import 'package:portfolio_prj/home/widgets/app_appbar.dart';
import 'package:portfolio_prj/home/widgets/project_item.dart';
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
    debugPrint('Size of screen is : ${MediaQuery.of(context).size.width}');
    return Scaffold(
      appBar: AppAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              _buildIntroductionWidget(),
              _buildTechStackWidget(),
              _buidldProjectsWidget(),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroductionWidget() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(180, 80, 220, 0),
        child: Row(
          children: [
            Expanded(
              child: Text.rich(TextSpan(
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
            ),
            const Expanded(
                child: AppCircleAvatar(
                    url: AppImages.avatar, size: Size(350, 350)))
          ],
        ));
  }

  Widget _buildTechStackWidget() {
    const languages = Languages.values;
    return Padding(
        padding: const EdgeInsets.fromLTRB(180, 330, 180, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('My Tech Stack',
                style: AppStyles.header.copyWith(color: AppColors.turple)),
            const SizedBox(height: 25),
            Text('Technologies I’ve been working with recently',
                style: AppStyles.header.copyWith(
                    color: AppColors.brown,
                    fontSize: 32,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: 30),
            GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: languages.length,
                shrinkWrap: true,
                primary: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    crossAxisCount: 3,
                    childAspectRatio: 0.1 / 0.05),
                itemBuilder: (context, index) => Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(languages.elementAt(index).url)))
          ],
        ));
  }

  Widget _buidldProjectsWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 190, right: 190),
      child: Column(
        children: [
          const SizedBox(height: 200),
          Text('Projects',
              style: AppStyles.header.copyWith(color: AppColors.turple)),
          const SizedBox(height: 25),
          Text('Things I’ve built so far',
              style: AppStyles.header.copyWith(
                  color: AppColors.brown,
                  fontSize: 32,
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 100),
          GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: 6,
              shrinkWrap: true,
              primary: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2 / 3.5,
                  mainAxisSpacing: 62,
                  crossAxisSpacing: 45,
                  crossAxisCount: 3),
              itemBuilder: (context, index) => const ProjectItem())
        ],
      ),
    );
  }
}
