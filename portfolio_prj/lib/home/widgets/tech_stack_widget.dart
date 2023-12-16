import 'package:flutter/material.dart';
import 'package:portfolio_prj/home/widgets/tech_item.dart';
import '../../common/common.dart';
import '../../res/res.dart';

class TechStackWidget extends StatefulWidget {
  const TechStackWidget({super.key, required this.techStackKey});
  final GlobalKey techStackKey;
  @override
  State<TechStackWidget> createState() => _TechStackWidgetState();
}

class _TechStackWidgetState extends State<TechStackWidget>
    with SingleTickerProviderStateMixin {
  final List<Languages> languages = Languages.values;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.techStackKey,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText('My Tech Stack',
            style: AppStyles.header.copyWith(fontSize: 40)),
        const SizedBox(height: 30),
        AppText('Technologies I’ve been working with recently',
            style: AppStyles.header
                .copyWith(fontSize: 28, fontWeight: FontWeight.w400)),
        const SizedBox(height: 15),
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: languages.length,
            shrinkWrap: true,
            primary: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: context.width / 3,
                mainAxisExtent:
                    context.responsive(mobile: 50, desktop: 150, tablet: 100),
                mainAxisSpacing:
                    context.responsive(mobile: 20, tablet: 30, desktop: 30)),
            itemBuilder: (context, index) => TechItem(
                  languages: languages.elementAt(index),
                ))
      ],
    );
  }
}
