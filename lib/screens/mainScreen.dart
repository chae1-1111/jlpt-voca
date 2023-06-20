import 'package:flutter/material.dart';
import 'package:voca/screens/levelDetail.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "JLPT 단어장",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.grid_view_rounded,
                        size: 30,
                        color: isGrid ? Colors.black : Colors.grey[400],
                      ),
                      onPressed: () {
                        setState(() {
                          isGrid = true;
                        });
                      },
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.format_list_bulleted_rounded,
                        size: 30,
                        color: isGrid ? Colors.grey[400] : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isGrid = false;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 16,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LevelList(
                        levels: const [
                          "N5",
                          "N4",
                          "N3",
                          "N2",
                          "N1",
                        ],
                        isGrid: isGrid,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LevelList extends StatelessWidget {
  final List<String> levels;
  final bool isGrid;

  const LevelList({
    super.key,
    required this.levels,
    required this.isGrid,
  });

  List<Widget> getItems() {
    List<Widget> result = [];

    for (String level in levels) {
      result.add(
        isGrid
            ? LevelItem(
                name: level,
                total: 500,
                completed: 100,
                isGrid: isGrid,
              )
            : LevelItem(
                name: level,
                total: 500,
                completed: 100,
                isGrid: isGrid,
              ),
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return isGrid
        ? Padding(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            child: Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              spacing: 30,
              runSpacing: 30,
              children: [
                ...getItems(),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...getItems(),
              ],
            ),
          );
  }
}

class LevelItem extends StatelessWidget {
  final String name;
  final int total, completed;
  final bool isGrid;

  const LevelItem({
    super.key,
    required this.name,
    required this.total,
    required this.completed,
    required this.isGrid,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LevelDetail(
                  name: name,
                  total: total,
                  completed: completed,
                ),
              ),
            );
          },
          child: Container(
            width: isGrid ? 150 : null,
            height: isGrid ? 150 : null,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            decoration: isGrid
                ? BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  )
                : const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  isGrid ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: isGrid ? 60 : 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: isGrid ? 0 : 10,
                ),
                Row(
                  mainAxisAlignment: isGrid
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    Container(
                      width: isGrid ? 80 : 300,
                      height: 14,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: completed,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(7),
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
                      width: 10,
                    ),
                    Text("${(completed / total * 100).floor()}%"),
                  ],
                ),
              ],
            ),
          ),
        ),
        isGrid
            ? const SizedBox()
            : const Divider(
                thickness: 1,
                height: 1,
              ),
      ],
    );
  }
}
