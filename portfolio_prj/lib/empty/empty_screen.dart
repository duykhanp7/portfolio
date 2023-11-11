import 'package:flutter/cupertino.dart';
import 'package:portfolio_prj/res/app_text.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child:  const AppText('Opps! Something went wrong.'),
    );
  }
}
