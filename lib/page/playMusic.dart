import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlayMusic extends StatefulWidget {
  String name;
  String author;

  PlayMusic({this.author, this.name});
  @override
  _PlayMusicState createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> {
  double _value = 0.0;
  void setValues(double values) {
    setState(() {
      _value = values;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            buildAppBar(context),
            SizedBox(
              height: mq.height * 0.03,
            ),
            buildImage(mq),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildStylishText(
                  name: widget.name,
                ),
                buildStylishText(
                  name: widget.author,
                  textStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mq.height * 0.05,
            ),
            buildThreeIconRow(mq),
          ],
        ),
      ),
    );
  }

  Widget buildThreeIconRow(Size mq) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildStylishText(
                  name: "${(_value * 3.45).roundToDouble()}",
                  textStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                buildStylishText(
                  name: "3.45",
                  textStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Slider(value: _value, onChanged: setValues),
          SizedBox(
            height: mq.height * 0.06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildStylishIcon(
                  icon: Icon(Icons.fast_rewind),
                  color: Colors.grey[300],
                  icons: Colors.grey),
              SizedBox(width: 15),
              buildStylishIcon(
                  icon: Icon(Icons.pause),
                  color: Colors.blue[400],
                  icons: Colors.white),
              SizedBox(width: 15),
              buildStylishIcon(
                  icon: Icon(Icons.fast_forward),
                  color: Colors.grey[300],
                  icons: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImage(Size mq) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: mq.height * 0.28,
      width: mq.width * 0.6,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1586348943529-beaae6c28db9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=358&q=80"),
            fit: BoxFit.cover),
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(130),
        boxShadow: [
          BoxShadow(
              color: Colors.black54,
              offset: Offset(5.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-5.0, -5.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(5.0, 5.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5.0, -5.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                ],
              ),
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.pop(context);
                  })),
          Text(
            "playing now".toUpperCase(),
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(5.0, 5.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5.0, -5.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                ],
              ),
              child: IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.grey,
                  onPressed: () {})),
        ],
      ),
    );
  }

  Widget buildStylishText({String name, TextStyle textStyle}) {
    return Text(name, style: textStyle);
  }

  Widget buildStylishIcon({Icon icon, Color color, Color icons}) {
    return Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[500],
                offset: Offset(5.0, 5.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-5.0, -5.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ],
        ),
        child: IconButton(icon: icon, color: icons, onPressed: () {}));
  }
}
