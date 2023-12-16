import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_prj/common/common.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TechItem extends StatefulWidget {
  const TechItem({super.key, required this.languages});

  final Languages languages;

  @override
  State<TechItem> createState() => _TechItemState();
}

class _TechItemState extends State<TechItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.ease)
        .drive(Tween<double>(begin: 0.95, end: 1.0));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) => ScaleTransition(
        scale: scaleAnimation,
        child: child,
      ),
      child: Material(
        elevation: 0,
        color: Colors.transparent,
        child: InkWell(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onHover: (hover) {
            if (hover) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          },
          onTap: () async {
            await launchUrlString(widget.languages.urlDocs);
          },
          child: Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(widget.languages.url)),
        ),
      ),
    );
  }
}
