import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_10_am/modules/layout/widgets/surah_name_widget.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/qur2an_screen_logo.png"),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                "surah_name".tr(),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge!.copyWith(fontSize: 24),
              )),
               SizedBox(height: size.height * 0.045, child: VerticalDivider()),
              Expanded(
                  child: Text(
                "sura_verses".tr(),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge!.copyWith(fontSize: 24),
              )),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 114,
              itemBuilder: (context, index) {
                return SurahNameWidget(index: index);
              },
            ),
          )
        ],
      ),
    );
  }
}
