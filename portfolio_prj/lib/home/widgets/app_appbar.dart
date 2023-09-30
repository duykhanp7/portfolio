import 'package:flutter/material.dart';
import 'package:portfolio_prj/home/widgets/gradient_text.dart';
import 'package:portfolio_prj/home/widgets/item_menu.dart';
import 'package:portfolio_prj/res/res.dart';

class AppAppBar extends StatefulWidget with PreferredSizeWidget {
  AppAppBar({super.key});

  @override
  State<StatefulWidget> createState() => _AppAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(220);
}

class _AppAppBar extends State<AppAppBar> {
  final menus = ['Home', 'About', 'Tech Stack', 'Projects', 'Contact'];
  final socialIcons = [
    AppIcons.icGithub,
    AppIcons.icTwitter,
    AppIcons.icLinkedIn
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
            padding: EdgeInsets.zero,
            child: Container(
              height: 100,
              decoration:
                  BoxDecoration(color: AppColors.white, boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: const Offset(0, 1),
                    color: AppColors.black.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 1)
              ]),
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(150, 10, 0, 15),
            child: _buildPrefix())
      ],
    );
  }

  Widget _buildPrefix() {
    return Container(
      alignment: Alignment.center,
      height: 80,
      child: Row(
        children: [
          _buildGradientText(),
          const Spacer(),
          _buildActionMenu(),
          const SizedBox(width: 30),
          _buildSocialsButton(),
        ],
      ),
    );
  }

  Widget _buildGradientText() {
    return GradientText('{007}\npavamng',
        style:
            AppStyles.menu.copyWith(fontSize: 27, fontWeight: FontWeight.w700),
        gradient:
            const LinearGradient(colors: [AppColors.blue, AppColors.pink]));
  }

  Widget _buildActionMenu() {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                ItemMenu(title: menus[index], onClick: () {}),
            separatorBuilder: (context, index) => const SizedBox(width: 50),
            itemCount: menus.length),
      ),
    );
  }

  Widget _buildSocialsButton() {
    return SizedBox(
      height: 50,
      child: Row(
        children: List.generate(
            socialIcons.length,
            (index) => AppSocialButton(
                  icon: socialIcons[index],
                  onClick: () {},
                )),
      ),
    );
  }
}
