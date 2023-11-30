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

enum SocialType {
  github('Github', 'https://github.com/duykhanp7', AppIcons.icGithub),
  twitter(
      'Twitter', 'https://www.facebook.com/1tieng60phut', AppIcons.icTwitter),
  linkedIn('Linked In', 'https://www.linkedin.com/in/duykhanp7/',
      AppIcons.icLinkedIn);

  final String title;
  final String url;
  final String icon;
  const SocialType(this.title, this.url, this.icon);
}

enum MenuCategory {
  home('Home'),
  about('About'),
  techStack('Tech Stack'),
  projects('Projects'),
  contact('Contact');

  final String title;
  const MenuCategory(this.title);
}

enum AppDirection { horizontal, vertical }
