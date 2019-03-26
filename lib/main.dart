import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Song> _songs;
  @override
  void initState() {
    super.initState();
    initplayer();
  }

  Future<Null> initplayer() async {
    var songs = await MusicFinder.allSongs();
    List<Song> song1 = new List.from(songs);
    this.setState(() {
      _songs = song1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new HomePage(_songs),
    );
  }
}

class HomePage extends StatefulWidget {
  final List<Song> _songs;
  HomePage(this._songs);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Music Application"),
      ),
      body: new ListView.builder(
        itemCount: widget._songs == null ? 0 : widget._songs.length,
        itemBuilder: (context, int index) {
          return new ListTile(
            leading: new CircleAvatar(
              child: new Text(widget._songs[index].title[0]),
            ),
            title: new Text(widget._songs[index].title),
          );
        },
      ),
    );
  }
}
