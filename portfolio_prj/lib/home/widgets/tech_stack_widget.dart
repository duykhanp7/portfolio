import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/common.dart';
import '../../res/res.dart';

class TechStackWidget extends StatefulWidget {
  const TechStackWidget({super.key, required this.techStackKey});
  final GlobalKey techStackKey;
  @override
  State<TechStackWidget> createState() => _TechStackWidgetState();
}

class _TechStackWidgetState extends State<TechStackWidget> {
  @override
  Widget build(BuildContext context) {
    const languages = Languages.values;
    return Column(
      key: widget.techStackKey,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText('My Tech Stack',
            style: AppStyles.header
                .copyWith(color: AppColors.turple, fontSize: 40)),
        const SizedBox(height: 15),
        AppText('Technologies I’ve been working with recently',
            style: AppStyles.header.copyWith(
                color: AppColors.brown,
                fontSize: 28,
                fontWeight: FontWeight.w400)),
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
            itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(languages.elementAt(index).url)))
      ],
    );
  }
}
