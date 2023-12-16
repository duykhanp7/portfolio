import 'package:portfolio_prj/res/app_icons.dart';

enum Languages {
  c('C', 'c', AppIcons.icC, 'https://www.w3schools.com/c/'),
  cplusplus(
      'C++', 'c++', AppIcons.icCPlusPlus, 'https://www.w3schools.com/cpp/'),
  git('Git', 'git', AppIcons.icGit, 'https://git-scm.com/doc'),
  flutter(
      'Flutter', 'flutter', AppIcons.icFlutter, 'https://docs.flutter.dev/'),
  java('Java', 'java', AppIcons.icJava, 'https://dev.java/learn/'),
  kotlin('Kotlin', 'kotlin', AppIcons.icKotlin,
      'https://kotlinlang.org/docs/home.html');

  const Languages(this.title, this.code, this.url, this.urlDocs);

  final String title;
  final String code;
  final String url;
  final String urlDocs;
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
