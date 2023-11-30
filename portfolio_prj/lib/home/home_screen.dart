import 'package:flutter/material.dart';
import 'package:portfolio_prj/common/common.dart';
import 'package:portfolio_prj/res/res.dart';
import 'widgets/widget.dart';

// This is home screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

final List<GlobalKey> scrollKey = [];

class _HomeScreen extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final techKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  final GlobalKey<ScaffoldState> drawer = GlobalKey();

  @override
  void initState() {
    scrollKey.addAll([homeKey, aboutKey, techKey, projectKey, contactKey]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(context.screenOf());
    final scaffold = Scaffold(
      key: drawer,
      drawer: context.isDesktop || context.isTablet ? null : _buildDrawer(),
      appBar: _buildAppBar(),
      body: _buildContent(),
    );

    return scaffold;
  }

  AppAppBar _buildAppBar() {
    return AppAppBar(
      padding: context.isDesktop || context.isTablet
          ? null
          : const EdgeInsets.only(left: 10),
      height: context.isDesktop || context.isTablet ? 250 : kToolbarHeight,
      prefix: context.isDesktop || context.isTablet
          ? const AppLogoText()
          : AppButton(
              icon: AppIcons.icMenu,
              size: const Size(20, 20),
              onTap: () {
                drawer.currentState?.openDrawer();
              },
            ),
      suffix: context.isDesktop || context.isTablet
          ? _buildSuffix()
          : [Container()],
      onPrefixTap: () => scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: const Duration(seconds: 2),
          curve: Curves.linearToEaseOut),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            child: _buildHeaderDrawer(),
          ),
          const SizedBox(height: 40),
          MenuWidget(
            height: 40,
            fontSize: 30,
            onTap: doAction,
            direction: AppDirection.vertical,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderDrawer() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: kToolbarHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const AppCircleAvatar(
                  url: AppImages.avatar, size: Size(100, 100)),
              const SizedBox(width: 10),
              ...textOwener(textAuth: false, fontSize: 45)
            ],
          ),
          const SocialWidget(),
          const SizedBox(height: 15),
          const InfoEmailPhoneWidget(direction: AppDirection.vertical),
        ].addSeperator(const SizedBox(height: 5)),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      child: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            AboutWidget(aboutKey: aboutKey),
            SizedBox(height: context.isDesktop || context.isTablet ? 330 : 100),
            TechStackWidget(techStackKey: techKey),
            SizedBox(height: context.isDesktop || context.isTablet ? 180 : 100),
            ProjectWidget(projectKey: projectKey),
            SizedBox(
                height: context.responsive(
                    mobile: 50, desktop: 100, tablet: 50, watch: 5)),
            context.isDesktop || context.isTablet
                ? ContactWidget(contactKey: contactKey, onTap: doAction)
                : Container()
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSuffix() {
    return [
      MenuWidget(height: 50, fontSize: 25, onTap: doAction),
      SizedBox(
          width:
              context.responsive(mobile: 5, desktop: 20, tablet: 10, watch: 0)),
      const SocialWidget(showText: false, height: 50)
    ];
  }

  List<Widget> textOwener({bool textAuth = true, double fontSize = 20}) {
    return [
      textAuth
          ? AppText('Designed and built by ',
              style: AppStyles.menu.copyWith(fontSize: fontSize))
          : Container(),
      Expanded(
        child: GradientText('Khang Pham',
            alignment: TextAlign.left,
            style: AppStyles.menu.copyWith(fontSize: fontSize),
            gradient:
                const LinearGradient(colors: [AppColors.blue, AppColors.pink])),
      )
    ];
  }

  void doAction(MenuCategory category) {
    context.scrollTo(getKey(category).currentContext!);
    if (drawer.currentState?.isDrawerOpen ?? false) {
      context.pop();
    }
  }

  GlobalKey getKey(MenuCategory category) => switch (category) {
        MenuCategory.about => aboutKey,
        MenuCategory.contact => contactKey,
        MenuCategory.home => homeKey,
        MenuCategory.projects => projectKey,
        MenuCategory.techStack => techKey,
      };
}
