import 'package:flutter/material.dart';

class BgWidget extends StatelessWidget {
  Widget child;
   BgWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration:const  BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_screens.png"),
              fit: BoxFit.cover)),
      child: child
    );
  }
}
