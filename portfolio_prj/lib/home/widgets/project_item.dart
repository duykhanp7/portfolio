import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_prj/common/extension/app_ex.dart';
import 'package:portfolio_prj/data/project_model.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../res/res.dart';

class ProjectItem extends StatefulWidget {
  const ProjectItem({super.key, required this.item});

  final ProjectModel item;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> alignmentAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          })
          ..forward();
    alignmentAnimation = TweenSequence([
      TweenSequenceItem(
          tween:
              AlignmentTween(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem(
          tween: AlignmentTween(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem(
          tween: AlignmentTween(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem(
          tween: AlignmentTween(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
    ]).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
                    child: Stack(
                      children: [
                        Align(
                          alignment: alignmentAnimation.value,
                          child: Image.asset(widget.item.url,
                              width: double.infinity,
                              height: double.infinity,
                              filterQuality: FilterQuality.high,
                              scale: 5,
                              fit: BoxFit.cover),
                        )
                      ],
                    )),
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
                            AppText(widget.item.title,
                                textAlign: TextAlign.start,
                                style: AppStyles.title.copyWith(
                                  fontSize: 30,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                )),
                            AppText(widget.item.content,
                                textAlign: TextAlign.start,
                                style: AppStyles.title.copyWith(
                                    fontSize: 25,
                                    color: const Color(0XFF666666),
                                    fontWeight: FontWeight.w300)),

                            /// Tech stack
                            AppText('Tech stack : ',
                                child: [
                                  TextSpan(
                                      text: widget.item.techStack,
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
                                  await launchUrlString(
                                      widget.item.urlLivePreview);
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
                                await launchUrlString(widget.item.urlViewCode);
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
