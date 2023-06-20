import 'package:flutter/material.dart';
import 'package:voca/screens/todayLearn.dart';

class LevelDetail extends StatelessWidget {
  final String name;
  final int total, completed;

  const LevelDetail({
    super.key,
    required this.name,
    required this.total,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JLPT $name",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LevelProgress(completed: completed, total: total),
            const SizedBox(
              height: 30,
            ),
            const BtnTodayLearn()
          ],
        ),
      ),
    );
  }
}

class BtnTodayLearn extends StatelessWidget {
  const BtnTodayLearn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => const TodayLearn(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 13,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 25,
            ),
            Text(
              "오늘의 학습",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class LevelProgress extends StatelessWidget {
  const LevelProgress({
    super.key,
    required this.completed,
    required this.total,
  });

  final int completed;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 18,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Row(
              children: [
                Flexible(
                  flex: completed,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                Flexible(
                  flex: total - completed,
                  child: const SizedBox(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "${(completed / total * 100).floor()}% ($completed / $total)",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
