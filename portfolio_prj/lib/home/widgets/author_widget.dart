import 'package:flutter/cupertino.dart';
import 'package:portfolio_prj/home/widgets/widget.dart';

import '../../res/res.dart';

class AuthorWidget extends StatefulWidget {
  const AuthorWidget(
      {super.key,
      this.textAuth = true,
      this.fontSize = 20,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.center});
  final bool textAuth;
  final double fontSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  State<AuthorWidget> createState() => _AuthorWidgetState();
}

class _AuthorWidgetState extends State<AuthorWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      children: textOwener(),
    );
  }

  List<Widget> textOwener() {
    return [
      widget.textAuth
          ? AppText('Designed and built by ',
              textAlign: TextAlign.right,
              style: AppStyles.menu.copyWith(fontSize: widget.fontSize))
          : const SizedBox.shrink(),
      GradientText(' Khang Pham',
          alignment: TextAlign.right,
          style: AppStyles.menu.copyWith(fontSize: widget.fontSize),
          gradient:
              const LinearGradient(colors: [AppColors.blue, AppColors.pink])),
      widget.textAuth
          ? AppText(' version 1.1.0',
              style: AppStyles.menu.copyWith(fontSize: widget.fontSize))
          : const SizedBox.shrink()
    ];
  }
}
