import 'package:flutter/material.dart';
import 'package:portfolio_prj/common/extension/app_ex.dart';
import 'package:portfolio_prj/res/res.dart';

class AppAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    required this.onPrefixTap,
    required this.prefix,
    this.suffix,
    this.height,
    this.padding,
  });

  final VoidCallback onPrefixTap;
  final Widget prefix;
  final List<Widget>? suffix;
  final double? height;
  final EdgeInsets? padding;

  @override
  State<StatefulWidget> createState() => _AppAppBar();

  @override
  Size get preferredSize => Size.fromHeight(height ?? 220);
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
    return Container(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            boxShadow: <BoxShadow>[
              // BoxShadow(
              //     offset: const Offset(0, 1),
              //     color: AppColors.black.withOpacity(0.1),
              //     blurRadius: 6,
              //     spreadRadius: 1)
            ]),
        child: _buildWidget());
  }

  Widget _buildWidget() {
    return Container(
      alignment: Alignment.center,
      height: 80,
      child: Padding(
        padding: widget.padding ??
            EdgeInsets.fromLTRB(
                context.isDesktop || context.isTablet ? 50 : 10, 0, 10, 0),
        child: Row(
          children: [
            InkWell(
              onTap: widget.onPrefixTap,
              child: widget.prefix,
            ),
            const Spacer(),
            ...widget.suffix ?? []
          ],
        ),
      ),
    );
  }
}
