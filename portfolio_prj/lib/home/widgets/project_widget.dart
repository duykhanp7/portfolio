import 'package:flutter/cupertino.dart';
import 'package:portfolio_prj/common/extension/app_ex.dart';
import 'package:portfolio_prj/data/data.dart';
import 'package:portfolio_prj/home/widgets/project_item.dart';
import '../../res/res.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({super.key, required this.projectKey});
  final GlobalKey projectKey;
  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(key: widget.projectKey, children: [
      AppText('Projects',
          style:
              AppStyles.header.copyWith(color: AppColors.turple, fontSize: 40)),
      const SizedBox(height: 15),
      AppText('Things I’ve built so far',
          style: AppStyles.header.copyWith(
              color: AppColors.brown,
              fontSize: 28,
              fontWeight: FontWeight.w400)),
      SizedBox(height: context.isDesktop || context.isTablet ? 50 : 25),
      _buildListProjectItemOtherDevice()
    ]);
  }

  Widget _buildListProjectItemOtherDevice() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: context.width /
                context.responsive(
                    mobile: 1,
                    tablet: context.isLargeTablet ? 2 : 1,
                    desktop: 2),
            mainAxisExtent: context.responsive(
                mobile: 300,
                tablet: context.isLargeTablet ? 350 : 300,
                desktop: 400),
            mainAxisSpacing: 30,
            crossAxisSpacing: 30),
        padding: EdgeInsets.symmetric(
            horizontal: context.responsive(
                mobile: context.width * 0.05,
                tablet: context.width * 0.02,
                desktop: context.width * 0.02)),
        itemBuilder: (context, index) {
          return ProjectItem(item: projects.elementAt(index));
        });
  }
}
