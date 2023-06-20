import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TodayLearn extends StatelessWidget {
  const TodayLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("오늘의 학습"),
      ),
      body: GestureDetector(
        // onHorizontalDragUpdate: (details) {
        //   int sensitivity = 8;
        //   if (details.delta.dx > sensitivity) {
        //     print("swipe left");
        //   } else if (details.delta.dx < -sensitivity) {
        //     print("swipe right");
        //   }
        // },
        child: Container(
          child: const Column(
            children: [
              WordArea(),
              MeanArea(),
            ],
          ),
        ),
      ),
    );
  }
}

class WordArea extends StatefulWidget {
  const WordArea({
    super.key,
  });

  @override
  State<WordArea> createState() => _WordAreaState();
}

class _WordAreaState extends State<WordArea> {
  bool showKana = false;
  FlutterTts tts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    tts.setLanguage("jr");
    tts.setSpeechRate(0.4);

    return Flexible(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 10,
        ),
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "1 / 15",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 50),
                    Text(
                      "方面",
                      style: Theme.of(context).textTheme.headlineLarge!,
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        tts.speak("ほうめん");
                      },
                      icon: const Icon(
                        Icons.volume_up_rounded,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Text(
                  showKana ? "ほうめん" : "",
                  style: Theme.of(context).textTheme.headlineMedium!,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  showKana = !showKana;
                });
              },
              child: ToggleButton(
                activeText: "발음 숨기기",
                inActiveText: "발음보기",
                flag: showKana,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    super.key,
    required this.flag,
    required this.activeText,
    required this.inActiveText,
  });

  final String activeText, inActiveText;
  final bool flag;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          flag ? activeText : inActiveText,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 53,
          height: 25,
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.yellow.shade600,
            ),
            borderRadius: BorderRadius.circular(20),
            color: flag ? Colors.yellow[600] : Colors.transparent,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
                flag ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: flag ? Colors.white : Colors.yellow[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MeanArea extends StatefulWidget {
  const MeanArea({
    super.key,
  });

  @override
  State<MeanArea> createState() => _MeanAreaState();
}

class _MeanAreaState extends State<MeanArea> {
  bool showMean = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.yellow[50],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  showMean = !showMean;
                });
              },
              child: ToggleButton(
                flag: showMean,
                activeText: "뜻·예문 숨기기",
                inActiveText: "뜻·예문 보기",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: showMean
                    ? [
                        MeanItem(
                          index: 1,
                          mean: "방면, 그 근방",
                          sentence: const [
                            {
                              "kana": "とうきょう",
                              "kanji": "東京",
                            },
                            {
                              "kana": "ほうめん",
                              "kanji": "方面",
                            },
                          ],
                          sentenceMean: "도쿄 방면",
                        ),
                        MeanItem(
                          index: 2,
                          mean: "분야",
                          sentence: const [
                            {
                              "kana": "た",
                              "kanji": "多",
                            },
                            {
                              "kana": "ほうめん",
                              "kanji": "方面",
                            },
                          ],
                          sentenceMean: "다방면",
                        ),
                      ]
                    : [],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MeanItem extends StatelessWidget {
  MeanItem({
    super.key,
    required this.index,
    required this.mean,
    required this.sentence,
    required this.sentenceMean,
  }) {
    tts.setLanguage("jr");
    tts.setSpeechRate(0.4);
  }

  final int index;
  final String mean;
  final List<Map> sentence;
  final String sentenceMean;
  final FlutterTts tts = FlutterTts();

  late String ttsText;

  List<Widget> getSentence() {
    List<Widget> result = [];
    String text = "";

    for (Map item in sentence) {
      result.add(Furigana(kana: item['kana'], kanji: item['kanji']));
      text += item['kana'];
    }

    ttsText = text;

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              "$index.",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mean,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        ...getSentence(),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        tts.speak(ttsText);
                      },
                      icon: const Icon(
                        Icons.volume_up_rounded,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  sentenceMean,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Furigana extends StatelessWidget {
  const Furigana({
    super.key,
    required this.kana,
    required this.kanji,
  });

  final String kana, kanji;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          kana,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          kanji,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
