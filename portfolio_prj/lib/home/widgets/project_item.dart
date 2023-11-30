import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_prj/common/extension/app_ex.dart';
import 'package:portfolio_prj/data/project_model.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../res/res.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.item});

  final ProjectModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset.zero,
                color: AppColors.black.withOpacity(0.06),
                spreadRadius: 20,
                blurRadius: 15)
          ]),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    flex: 2,
                    child: Image.asset(AppImages.avatar,
                        width: double.infinity,
                        height: double.infinity,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover)),
                Expanded(
                    flex: 3,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            context.isDesktop ? 10 : 5,
                            10,
                            context.isDesktop ? 10 : 5,
                            context.isDesktop ? 10 : 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppText(item.title,
                                textAlign: TextAlign.start,
                                style: AppStyles.title.copyWith(
                                  fontSize: 30,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                )),
                            AppText(item.content,
                                textAlign: TextAlign.start,
                                style: AppStyles.title.copyWith(
                                    fontSize: 25,
                                    color: const Color(0XFF666666),
                                    fontWeight: FontWeight.w300)),

                            /// Tech stack
                            AppText('Tech stack : ',
                                child: [
                                  TextSpan(
                                      text: item.techStack,
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
                            const Spacer(),

                            /// Live preview
                            AppTextIconButton(
                                childCenter: true,
                                textAlign: TextAlign.center,
                                onTap: () async {
                                  await launchUrlString(item.urlLivePreview);
                                },
                                title: 'Live Preview',
                                style: AppStyles.content.copyWith(
                                    fontSize: 25,
                                    decoration: TextDecoration.underline),
                                icon: AppIcons.icAttach),

                            /// View code
                            AppTextIconButton(
                              childCenter: true,
                              textAlign: TextAlign.center,
                              title: 'View Code',
                              onTap: () async {
                                await launchUrlString(item.urlViewCode);
                              },
                              icon: AppIcons.icGithub,
                              style: AppStyles.content.copyWith(
                                  fontSize: 25,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        )))
              ])),
    );
  }
}
