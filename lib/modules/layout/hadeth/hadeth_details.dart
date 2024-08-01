import 'package:flutter/material.dart';
import 'package:islami_10_am/core/widgets/bg_widget.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "hadethDetails";
  HadethDetails({super.key});

  String title = "";
  String details = "";
  @override
  Widget build(BuildContext context) {
    String hadeth = ModalRoute.of(context)!.settings.arguments as String;
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    getHeader(hadeth);
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Islami"),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(
                bottom: size.height * 0.2,
                left: size.width * 0.05,
                right: size.width * 0.05,
                top: size.height * 0.1),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow:const [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 4, spreadRadius: 3),
                ],
                borderRadius: BorderRadius.circular(25)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge,
                  ),
                  Divider(),
                  Text(
                    details,
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getHeader(String hadeth) {
    title = hadeth.split("\n")[0];
    details = hadeth.split("\n")[1];
  }
}
