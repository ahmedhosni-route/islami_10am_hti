import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../hadeth/hadeth_details.dart';

class HadethScreen extends StatefulWidget {
  HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<String> hadethText = [];
  List<String> hadethTitles = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (hadethTitles.isEmpty) {
      readHadeth();
    }
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/hadeth_logo.png"),
          Divider(),
          Text(
            "ahadeth".tr(),
            style: theme.textTheme.bodyLarge,
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: hadethTitles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, HadethDetails.routeName,arguments: hadethText[index]);
                      },
                      child: Text(
                        hadethTitles[index],
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge,
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  readHadeth() async {
    String hadeth = await rootBundle.loadString("assets/Hadeeth/ahadeth.txt");
    hadethText = hadeth.split("#");
    for (int i = 0; i < hadethText.length; i++) {
      hadethText[i] = hadethText[i].trim();
      String title = hadethText[i].split("\n")[0];
      hadethTitles.add(title.trim());
      print(title);
    }
    setState(() {});
  }
}
