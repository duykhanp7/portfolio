import 'package:flutter/material.dart';
import 'package:portfolio_prj/home/widgets/gradient_text.dart';
import 'package:portfolio_prj/home/widgets/item_menu.dart';
import 'package:portfolio_prj/res/app_social_button.dart';
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
    '',
    AppIcons.icTwitter,
    '',
    AppIcons.icLinkedIn
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(150, 41, 0, 0),
        child: _buildPrefix());
  }

  Widget _buildPrefix() {
    return Container(
      alignment: Alignment.center,
      height: 70,
      child: Row(
        children: [
          _buildGradientText(),
          const SizedBox(width: 306),
          _buildActionMenu(),
          const SizedBox(width: 30),
          _buildSocialsButton(),
          const SizedBox(width: 30),
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
            shrinkWrap: true,
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
            (index) => socialIcons[index].isNotEmpty
                ? AppSocialButton(
                    icon: socialIcons[index],
                    onClick: () {},
                  )
                : const SizedBox(width: 20)),
      ),
    );
  }
}
