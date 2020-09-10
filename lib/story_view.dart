import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryViewPage extends StatefulWidget {
  // final DateTime statusGivenTime;
  // final String name;
  // final String profileUrl;
  //
  // StoryView({this.name, this.profileUrl, this.statusGivenTime,})

  @override
  _StoryViewPageState createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage> {
  final StoryController storyController = StoryController();

  List<StoryItem> storyItemsList = [
    StoryItem.text(
      title: "Adventure",
      backgroundColor: Colors.green,
    ),
    StoryItem.inlineImage(
      url:
          "https://upload.wikimedia.org/wikipedia/commons/5/5a/Monument_Valley_2.jpg",
      caption: Text("Image of the day"),
      // controller: storyController,
    ),
    StoryItem.pageImage(
        url:
            "https://upload.wikimedia.org/wikipedia/commons/7/72/Snow_Scene_at_Shipka_Pass_1.JPG",
        caption: "Trying"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          // SizedBox(
          //   height: 2,
          // ),
          Column(mainAxisAlignment: MainAxisAlignment.start,children: [
            Container(
              height: 550,
              width: double.infinity,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.hardEdge,
                child: StoryView(
                  storyItems: storyItemsList,
                  controller: storyController,
                  onStoryShow: (story) {
                    print("Showing a story");
                  },
                  onComplete: () {
                    print("Complete a cycle");
                  },
                  progressPosition: ProgressPosition.top,
                  repeat: true,
                ),
              ),
            ),
            Container(
              height: 55,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      "Reply",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    // SizedBox(height: 5,)
                  ],
                ),
              ),
            ),
          ],),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 36),
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.black,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xffe6ecf1),
                      radius: 24,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black,
                        child: Center(
                          child: Text(
                            "DP",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Time",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
