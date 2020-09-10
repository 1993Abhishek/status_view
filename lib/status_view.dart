// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status_view/story_view.dart';
import 'package:story_view/story_view.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  Widget box(String boxText, bool leftWidget) {
    return Container(
      height: 30,
      width: 87,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black54,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              boxText,
              style: TextStyle(fontSize: 12),
            ),
            leftWidget ? Icon(Icons.keyboard_arrow_down) : Container(),
          ],
        ),
      ),
    );
  }
  final StoryController storyController= StoryController();

  List<StoryItem> storyItemsList = [
    StoryItem.text(
      title: "Adventure",
       backgroundColor: Colors.green,
    ),
    StoryItem.inlineImage(
      url:"https://upload.wikimedia.org/wikipedia/commons/5/5a/Monument_Valley_2.jpg",
      caption: Text("Image of the day"),
      // controller: storyController,
    ),
    StoryItem.pageImage(

        url:"https://upload.wikimedia.org/wikipedia/commons/7/72/Snow_Scene_at_Shipka_Pass_1.JPG",

      caption: "Trying"
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6ecf1),
      appBar: AppBar(
        leading: Icon(
          Icons.chevron_left,
          size: 40,
        ),
        backgroundColor: Colors.purple,
        title: Text("Geico"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 30,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xffe6ecf1),
                    child: Center(
                      child: Text(
                        "Logo",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  "55K\n Subscribers",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "**This page has not been claimed**",
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2, top: 5),
            child: Row(
              children: [
                box("iMailbox", false),
                SizedBox(
                  width: 3,
                ),
                box("iMailLimit", true),
                SizedBox(
                  width: 3,
                ),
                box("Website", false),
                SizedBox(
                  width: 3,
                ),
                box("Related", false),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => StoryViewPage()));
            },
            child: Padding(
              padding: EdgeInsets.only(left: 18),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 22,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xffe6ecf1),
                      child: Center(
                        child: Text(
                          "Click",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Geico's Reputation",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
            ),
            height: 30,
            width: double.infinity,
            color: Colors.purple,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "iMailbox",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              child: StoryView(
                storyItems: storyItemsList,
                controller: storyController,
                onStoryShow: (story){
                  print("Showing a story");
                },
                onComplete: (){
                  print("Complete a cycle");
                },
                progressPosition: ProgressPosition.bottom,
                repeat: true,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
