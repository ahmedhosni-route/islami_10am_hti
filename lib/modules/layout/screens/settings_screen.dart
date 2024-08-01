import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_10_am/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../manager/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        InkWell(
          onTap: () {
            showSheetLanguage(context);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.primaryLightColor)),
            child: const Text(
              "English",
            ),
          ),
        ),
        InkWell(
          onTap: () {
            showSheetTheme(context,provider);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.primaryLightColor)),
            child: const Text(
              "Light Theme",
            ),
          ),
        ),
      ],
    );
  }

  showSheetLanguage(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      showDragHandle: true,
      context: context,
      builder: (context) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                context.setLocale(Locale("en"));
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.primaryLightColor)),
                child: const Text(
                  "English",
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.setLocale(Locale("ar"));
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.primaryLightColor)),
                child: const Text(
                  "Arabic",
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  showSheetTheme(BuildContext context,SettingsProvider provider) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      showDragHandle: true,
      context: context,
      builder: (context) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
                Navigator.pop(context);


              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.primaryLightColor)),
                child: const Text(
                  "Light Mode",
                ),
              ),
            ),
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.primaryLightColor)),
                child: const Text(
                  "Dark Mode",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
