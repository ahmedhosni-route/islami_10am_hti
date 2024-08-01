import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_10_am/core/widgets/bg_widget.dart';
import 'package:islami_10_am/modules/layout/widgets/surah_name_widget.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "quranDetails";
  QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  String surah = "";
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SurahData data = ModalRoute.of(context)!.settings.arguments as SurahData;
    var theme = Theme.of(context);
    if (verses.isEmpty) {
      readData(data.index);
    }
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Islami"),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          margin:
              const EdgeInsets.only(top: 80, right: 15, left: 15, bottom: 35),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 5)
              ]),
          child: Center(
            child: verses.isEmpty
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data.surahName,
                            style: theme.textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(Icons.play_circle_fill_rounded)
                        ],
                      ),
                      const Divider(
                        indent: 60,
                        endIndent: 60,
                        thickness: 2,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: verses.length,
                          itemBuilder: (context, index) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                      text: verses[index].trim(),
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(
                                              fontFamily:
                                                  GoogleFonts.amiriQuran()
                                                      .fontFamily,
                                              fontSize: 25),
                                    ),
                                    TextSpan(
                                      text: "  ",
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(
                                              fontFamily:
                                                  GoogleFonts.amiriQuran()
                                                      .fontFamily),
                                    ),
                                    TextSpan(
                                      text: replaceArabicNumber(
                                          (index + 1).toString()),
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(
                                              fontFamily: "aya", fontSize: 35),
                                    ),
                                  ]),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  readData(int index) async {
    surah = await rootBundle.loadString("assets/Suras/${index + 1}.txt");
    surah = surah.trim();
    verses = surah.split("\n");
    setState(() {});
    print(surah);
  }

  String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ["٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], arabic[i]);
    }

    return input;
  }
}
