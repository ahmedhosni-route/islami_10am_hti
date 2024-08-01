import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modules/layout/manager/settings_provider.dart';

class BgWidget extends StatelessWidget {
  Widget child;
  BgWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(provider.themeMode == ThemeMode.light
                    ? "assets/images/bg_screens.png"
                    : "assets/images/dark_bg.png"),
                fit: BoxFit.cover)),
        child: child);
  }
}
