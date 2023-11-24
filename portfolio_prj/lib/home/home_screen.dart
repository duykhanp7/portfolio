import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_prj/common/extension/app_ex.dart';
import 'package:portfolio_prj/common/extension/enum_languages.dart';
import 'package:portfolio_prj/common/extension/list_ex.dart';
import 'package:portfolio_prj/home/widgets/app_appbar.dart';
import 'package:portfolio_prj/home/widgets/gradient_text.dart';
import 'package:portfolio_prj/home/widgets/item_menu.dart';
import 'package:portfolio_prj/home/widgets/project_item.dart';
import 'package:portfolio_prj/res/app_images.dart';
import 'package:portfolio_prj/res/app_text_icon_button.dart';
import 'package:portfolio_prj/res/res.dart';

// This is home screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final techKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  final List<GlobalKey> scrollKey = [];

  final GlobalKey<ScaffoldState> drawer = GlobalKey();

  final socialIcons = [
    AppIcons.icGithub,
    AppIcons.icTwitter,
    AppIcons.icLinkedIn
  ];

  final socialIconsText = ['Github', 'Twitter', 'Linked In'];

  final menus = ['Home', 'About', 'Tech Stack', 'Projects', 'Contact'];

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
          ? appLogoText()
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
          ..._menus(height: 40, fontSize: 30),
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
          Row(
            children: socialButton(),
          ),
          const SizedBox(height: 15),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: infoEmailPhone().addSeperator(const SizedBox(height: 2)),
          )
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
            _buildIntroductionWidget(),
            SizedBox(height: context.isDesktop || context.isTablet ? 330 : 100),
            _buildTechStackWidget(),
            SizedBox(height: context.isDesktop || context.isTablet ? 180 : 100),
            _buidldProjectsWidget(),
            SizedBox(
                height: context.responsive(
                    mobile: 50, desktop: 100, tablet: 50, watch: 5)),
            context.isDesktop || context.isTablet
                ? _buildContactWidget()
                : Container()
          ],
        ),
      ),
    );
  }

  Widget _buildIntroductionWidget() {
    return context.responsive(
      mobile: Padding(
          key: aboutKey,
          padding: EdgeInsets.fromLTRB(
              context.isDesktop
                  ? 180
                  : context.isTablet
                      ? 100
                      : 20,
              context.isDesktop ? 80 : 40,
              context.isDesktop ? 180 : 10,
              0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text.rich(
                    textScaler: TextScaler.linear(context.responsive<double>(
                        mobile: 0.5, tablet: 1, desktop: 1, watch: 0.5)),
                    TextSpan(
                        text: 'Hi👋,',
                        style: AppStyles.header
                            .copyWith(color: AppColors.turple, fontSize: 35),
                        children: [
                          TextSpan(
                              text: '\nMy name is',
                              style: AppStyles.header.copyWith(
                                  color: AppColors.turple, fontSize: 40)),
                          TextSpan(
                              text: '\nDuy Khang',
                              style: AppStyles.header.copyWith(
                                  fontSize: 40,
                                  foreground: Paint()
                                    ..shader = const LinearGradient(
                                      colors: <Color>[
                                        AppColors.blue,
                                        AppColors.pink
                                      ],
                                    ).createShader(const Rect.fromLTWH(
                                        0.0, 0.0, 200.0, 70.0)))),
                          TextSpan(
                              text: '\nI build things for mobile',
                              style: AppStyles.header.copyWith(
                                  color: AppColors.turple, fontSize: 40))
                        ])),
              ),
              Expanded(
                  flex: 1,
                  child: AppCircleAvatar(
                      url: AppImages.avatar,
                      size: context.responsive(
                          mobile: const Size(180, 180),
                          tablet: const Size(250, 250),
                          desktop: const Size(350, 350))))
            ],
          )),
    );
  }

  Widget _buildTechStackWidget() {
    const languages = Languages.values;
    return Column(
      key: techKey,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText('My Tech Stack',
            style: AppStyles.header
                .copyWith(color: AppColors.turple, fontSize: 35)),
        const SizedBox(height: 15),
        AppText('Technologies I’ve been working with recently',
            style: AppStyles.header.copyWith(
                color: AppColors.brown,
                fontSize: 28,
                fontWeight: FontWeight.w400)),
        const SizedBox(height: 15),
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: languages.length,
            shrinkWrap: true,
            primary: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 3,
                childAspectRatio: 0.1 / 0.04),
            itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(languages.elementAt(index).url)))
      ],
    );
  }

  Widget _buidldProjectsWidget() {
    return Column(key: projectKey, children: [
      AppText('Projects',
          style:
              AppStyles.header.copyWith(color: AppColors.turple, fontSize: 35)),
      const SizedBox(height: 15),
      AppText('Things I’ve built so far',
          style: AppStyles.header.copyWith(
              color: AppColors.brown,
              fontSize: 28,
              fontWeight: FontWeight.w400)),
      SizedBox(height: context.isDesktop || context.isTablet ? 50 : 25),
      ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
            left: context.isDesktop ? 80 : 30,
            right: context.isDesktop ? 80 : 30),
        itemCount: 6,
        shrinkWrap: true,
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     mainAxisSpacing: context.isDesktop ? 50 : 10,
        //     childAspectRatio: context.responsive<double>(
        //       mobile: 1 / 1.4,
        //       desktop: 1 / 2,
        //       tablet: context.isLargeTablet ? 1 / 2.5 : 1 / 1.5,
        //       watch: 1,
        //     ),
        //     crossAxisSpacing: context.isDesktop ? 50 : 10,
        //     crossAxisCount: context.isDesktop || context.isLargeTablet
        //         ? 3
        //         : context.isSmallTablet
        //             ? 2
        //             : 1),
        itemBuilder: (context, index) => const ProjectItem(),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      )
    ]);
  }

  List<Widget> _buildSuffix() {
    return [
      ..._menus(height: 50, fontSize: 25),
      SizedBox(
          width:
              context.responsive(mobile: 5, desktop: 20, tablet: 10, watch: 0)),
      ...socialButton(showText: false, height: 50)
    ];
  }

  List<Widget> socialButton(
      {double? mobile,
      double? desktop,
      double? tablet,
      double? watch,
      bool showText = false,
      double? height}) {
    final len = context.responsive<double>(
        mobile: mobile ?? 30,
        desktop: desktop ?? 30,
        tablet: context.isLargeTablet ? 25 : 20,
        watch: watch ?? 10);
    return List.generate(
        socialIcons.length,
        (index) => SizedBox(
              height: height,
              child: AppButton(
                size: Size(len, len),
                icon: socialIcons[index],
                iconColor: const Color(0XFF42446E),
                text: showText
                    ? context.isDesktop
                        ? null
                        : socialIconsText[index]
                    : null,
                onTap: () {},
              ),
            ));
  }

  List<Widget> infoEmailPhone(
      {TextAlign? textAlign, bool childCenter = false}) {
    return [
      AppTextIconButton(
          revert: true,
          childCenter: childCenter,
          textAlign: textAlign,
          onlyTapIcon: true,
          title: '0397439979',
          onTap: () async {
            await Clipboard.setData(const ClipboardData(text: '0397439979'));
            if (!mounted) {
              return;
            }
            context.showMessage('Copy phone successfully!');
          },
          icon: AppIcons.icContentCopy,
          style: AppStyles.menu
              .copyWith(color: const Color(0XFF42446E), fontSize: 30)),
      SizedBox(
          width: context.responsive<double>(
              mobile: 10, desktop: 60, tablet: 30, watch: 5)),
      AppTextIconButton(
          revert: true,
          onlyTapIcon: true,
          childCenter: childCenter,
          textAlign: textAlign,
          title: 'duykhangp7@gmail.com',
          onTap: () async {
            await Clipboard.setData(
                const ClipboardData(text: 'duykhangp7@gmail.com'));
            if (!mounted) {
              return;
            }
            context.showMessage('Copy email successfully!');
          },
          icon: AppIcons.icContentCopy,
          style: AppStyles.menu
              .copyWith(color: const Color(0XFF42446E), fontSize: 30)),
      SizedBox(
          width: context.responsive<double>(
              mobile: 10, desktop: 60, tablet: 30, watch: 5))
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

  List<Widget> _menus({double? height, double? fontSize}) {
    return List.generate(
        menus.length,
        (index) => SizedBox(
              height: height,
              child: ItemMenu(
                  fontSize: fontSize,
                  color: const [Color(0XFF42446E), Color(0XFF42446E)],
                  title: menus[index],
                  onTap: () {
                    context
                        .scrollTo(scrollKey.elementAt(index).currentContext!);
                    if (drawer.currentState?.isDrawerOpen ?? false) {
                      context.pop();
                    }
                  }),
            )).addSeperator(SizedBox(
        width:
            context.responsive(mobile: 5, desktop: 30, tablet: 5, watch: 0)));
  }

  Widget appLogoText({List<Color>? color}) {
    return GradientText('{007}\npavamng',
        style:
            AppStyles.menu.copyWith(fontSize: 27, fontWeight: FontWeight.w800),
        gradient:
            LinearGradient(colors: color ?? [AppColors.blue, AppColors.pink]));
  }

  Widget _buildContactWidget() {
    return Padding(
      padding: EdgeInsets.only(
        left: context.isDesktop ? 80 : 30,
        right: context.isDesktop ? 80 : 30,
        bottom: 100,
      ),
      child: context.isDesktop
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    appLogoText(),
                    const Spacer(),
                    ...infoEmailPhone(),
                    ...socialButton(mobile: 15, tablet: 20, desktop: 28),
                  ],
                ),
                const SizedBox(height: 60),
                const Divider(height: 2, color: AppColors.brown),
                const SizedBox(height: 60),
                Row(
                  children: [
                    ..._menus(fontSize: 25),
                    const Spacer(),
                    ...textOwener(fontSize: 25),
                  ],
                )
              ],
            )
          : Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        appLogoText(),
                        ..._menus(),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: true,
                          child: appLogoText(
                              color: [Colors.transparent, Colors.transparent]),
                        ),
                        ...infoEmailPhone(
                            textAlign: TextAlign.center, childCenter: true),
                        ...socialButton(
                            mobile: 15,
                            tablet: 20,
                            desktop: 28,
                            showText: true),
                      ],
                    )),
                  ],
                ),
                SizedBox(
                    height: context.responsive<double>(
                        mobile: 20, tablet: 30, desktop: 50, watch: 5)),
                const Divider(height: 2, color: AppColors.brown),
                SizedBox(
                    height: context.responsive<double>(
                        mobile: 20, tablet: 30, desktop: 50, watch: 5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: textOwener(fontSize: 25),
                )
              ],
            ),
    );
  }
}
