import 'package:portfolio_prj/res/app_icons.dart';

enum Languages {
  c('C', 'c', AppIcons.icC),
  cplusplus('C++', 'c++', AppIcons.icCPlusPlus),
  git('Git', 'git', AppIcons.icGit),
  flutter('Flutter', 'flutter', AppIcons.icFlutter),
  java('Java', 'java', AppIcons.icJava),
  kotlin('Kotlin', 'kotlin', AppIcons.icKotlin);

  const Languages(this.title, this.code, this.url);

  final String title;
  final String code;
  final String url;
}
