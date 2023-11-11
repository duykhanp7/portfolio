import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_prj/common/extension/app_ex.dart';
import 'package:portfolio_prj/res/app_colors.dart';
import 'package:portfolio_prj/res/app_icons.dart';
import 'package:portfolio_prj/res/app_images.dart';
import 'package:portfolio_prj/res/app_styles.dart';
import 'package:portfolio_prj/res/app_text.dart';
import 'package:portfolio_prj/res/app_text_icon_button.dart';

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
                color: AppColors.black.withOpacity(0.06),
                spreadRadius: 20,
                blurRadius: 15)
          ]),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    flex: 2,
                    child: Image.asset(AppImages.avatar,
                        height: 300,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover)),
                Expanded(
                    flex: 3,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            context.isDesktop ? 20 : 5,
                            10,
                            context.isDesktop ? 20 : 5,
                            context.isDesktop ? 20 : 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: AppText('Project Tile goes here',
                                  textAlign: TextAlign.start,
                                  style: AppStyles.title.copyWith(
                                    fontSize: 30,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            Flexible(
                              child: AppText(
                                  'This is sample project description random things are here in description This is sample project lorem ipsum generator for dummy content',
                                  textAlign: TextAlign.start,
                                  style: AppStyles.title.copyWith(
                                      fontSize: 25,
                                      color: const Color(0XFF666666),
                                      fontWeight: FontWeight.w300)),
                            ),
                            const SizedBox(height: 5),
                            Flexible(
                              child: AppText('Tech stack : ',
                                  child: [
                                    TextSpan(
                                        text: 'HTML , JavaScript, SASS, React',
                                        style: AppStyles.title.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 25,
                                            color: const Color(0XFF42446E)))
                                  ],
                                  textAlign: TextAlign.start,
                                  style: AppStyles.title.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
                                      color: const Color(0XFF42446E))),
                            ),

                            //Link
                            Row(
                              children: [
                                AppTextIconButton(
                                    childCenter: true,
                                    textAlign: TextAlign.center,
                                    onTap: () {},
                                    title: 'Live Preview',
                                    style: AppStyles.content.copyWith(
                                        fontSize: 25,
                                        decoration: TextDecoration.underline),
                                    icon: AppIcons.icAttach),
                                const SizedBox(
                                  width: 30,
                                ),
                                AppTextIconButton(
                                  childCenter: true,
                                  textAlign: TextAlign.center,
                                  title: 'View Code',
                                  onTap: () {
                                    //TO DO
                                  },
                                  icon: AppIcons.icGithub,
                                  style: AppStyles.content.copyWith(
                                      fontSize: 25,
                                      decoration: TextDecoration.underline),
                                )
                              ],
                            )
                          ],
                        )))
              ])),
    );
  }
}
