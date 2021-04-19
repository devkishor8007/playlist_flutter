import 'package:flutter/material.dart';
import 'package:playlist_flutter/model/songs_model.dart';
import 'package:playlist_flutter/page/playMusic.dart';

class HomeSongs extends StatefulWidget {
  @override
  _HomeSongsState createState() => _HomeSongsState();
}

class _HomeSongsState extends State<HomeSongs> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              buildTextTop(name: "thom yorke - playlist"),
              SizedBox(
                height: 10,
              ),
              buildRowBars(mq),
              SizedBox(
                height: mq.height * 0.06,
              ),
              buildListPlaySongs(mq, context),
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildTextTop({String name}) {
    return Center(
      child: Text(name.toUpperCase(),
          style: TextStyle(
            color: Colors.grey,
          )),
    );
  }

  Widget buildRowBars(Size mq) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildStylishIcon(
          icons: Icon(Icons.favorite),
        ),
        Container(
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
        ),
        buildStylishIcon(icons: Icon(Icons.more_horiz)),
      ],
    );
  }

  Widget buildListPlaySongs(Size mq, BuildContext context) {
    return Container(
      height: mq.height * 0.6,
      width: mq.width,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: getSongs.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                if (getSongs[index] == getSongs[2]) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PlayMusic(
                                name: getSongs[index].name,
                                author: getSongs[index].author,
                              )));
                }
                return null;
              },
              child: getSongs[index].isDesignl
                  ? Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                        child: ListTile(
                            title: Text(getSongs[index].name),
                            subtitle: Text(
                              getSongs[index].author,
                              style: TextStyle(color: Colors.grey),
                            ),
                            trailing: buildStylishIconPlay(
                              icons: Icon(
                                Icons.pause,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    )
                  : ListTile(
                      title: Text(getSongs[index].name),
                      subtitle: Text(
                        getSongs[index].author,
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: buildStylishIcon(
                        icons: Icon(Icons.play_arrow),
                      )),
            );
          }),
    );
  }

  Widget buildStylishIconPlay({Icon icons}) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          // color: Colors.blue[800],
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[200],
              Colors.blue[300],
              Colors.blue[400],
              Colors.blue[500],
            ],
          ),

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
        child: IconButton(icon: icons, color: Colors.grey, onPressed: () {}));
  }

  Widget buildStylishIcon({Icon icons}) {
    return Container(
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
        child: IconButton(icon: icons, color: Colors.grey, onPressed: () {}));
  }
}
