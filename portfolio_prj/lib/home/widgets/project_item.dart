import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_prj/res/app_colors.dart';
import 'package:portfolio_prj/res/app_icons.dart';
import 'package:portfolio_prj/res/app_images.dart';
import 'package:portfolio_prj/res/app_styles.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset.zero,
                color: AppColors.black.withOpacity(0.05),
                spreadRadius: 15,
                blurRadius: 15)
          ]),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 3,
                    child: Image.asset(
                      AppImages.avatar,
                      width: double.infinity,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    )),
                Expanded(
                    flex: 4,
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 30, 25),
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text('Project Tile goes here',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.title.copyWith(
                                      fontSize: 28, color: AppColors.black)),
                            )),
                            Expanded(
                                flex: 3,
                                child: Text(
                                    'This is sample project description random things are here in description This is sample project lorem ipsum generator for dummy content',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style: AppStyles.title.copyWith(
                                        fontSize: 18,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w300))),
                            Expanded(
                                child: Text(
                                    'Tech stack : HTML , JavaScript, SASS, React',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style: AppStyles.title.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: AppColors.black))),
                            Expanded(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.icAttach,
                                  ),
                                  const Expanded(child: Text('Live Preview')),
                                  const Spacer(),
                                  SvgPicture.asset(
                                    AppIcons.icGithub,
                                  ),
                                  const Expanded(child: Text('View Code'))
                                ],
                              ),
                            ),
                          ],
                        )))
              ])),
    );
  }
}
