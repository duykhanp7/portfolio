import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_prj/common/common.dart';
import 'package:portfolio_prj/home/widgets/author_widget.dart';
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

class _HomeScreen extends State<HomeScreen> with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final techKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  final GlobalKey<ScaffoldState> drawer = GlobalKey();

  // Animation controller
  late AnimationController _avatarScaleAnimationController;
  late AnimationController _typingTextAnimationController;

  @override
  void initState() {
    scrollKey.addAll([homeKey, aboutKey, techKey, projectKey, contactKey]);
    initAnimationController();
    super.initState();
  }

  @override
  void dispose() {
    _avatarScaleAnimationController.dispose();
    _typingTextAnimationController.dispose();
    super.dispose();
  }

  void initAnimationController() {
    /// Avatar
    _avatarScaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    /// Typing text
    _typingTextAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(context.screenOf());
    final scaffold = Scaffold(
      key: drawer,
      drawer: context.isDesktop || context.isTablet ? null : _buildDrawer(),
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.backgroundGif),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.01),
            child: _buildContent(),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
    );

    return scaffold;
  }

  PreferredSizeWidget _buildAppBar() {
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
              iconColor: Colors.white,
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
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.7),
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
              AppCircleAvatar(
                url: AppImages.avatar2,
                size: const Size(100, 100),
                listenable: _avatarScaleAnimationController,
              ),
              const SizedBox(width: 10),
              const Flexible(child: AuthorWidget(textAuth: false, fontSize: 45))
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
      child: Stack(
        children: [
          Column(
            children: [
              AboutWidget(
                aboutKey: aboutKey,
                avatarListenable: _avatarScaleAnimationController,
                introdutionListenable: _typingTextAnimationController,
              ),
              SizedBox(
                  height: context.isDesktop || context.isTablet ? 330 : 100),
              TechStackWidget(techStackKey: techKey),
              SizedBox(
                  height: context.isDesktop || context.isTablet ? 180 : 100),
              ProjectWidget(projectKey: projectKey),
              SizedBox(
                  height: context.responsive(
                      mobile: 50, desktop: 100, tablet: 50, watch: 5)),
              context.isDesktop || context.isTablet
                  ? ContactWidget(contactKey: contactKey, onTap: doAction)
                  : Container()
            ],
          )
        ],
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

  void doAction(MenuCategory category) {
    context.scrollTo(getKey(category).currentContext!);
    if (drawer.currentState?.isDrawerOpen ?? false) {
      context.pop();
    }
    // * Should optimize this problem
    // ? Should repare this problem
    // ! Should fix this problem
  }

  GlobalKey getKey(MenuCategory category) => switch (category) {
        MenuCategory.about => aboutKey,
        MenuCategory.contact => contactKey,
        MenuCategory.home => homeKey,
        MenuCategory.projects => projectKey,
        MenuCategory.techStack => techKey,
      };
}
