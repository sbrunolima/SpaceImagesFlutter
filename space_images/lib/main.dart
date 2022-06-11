import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() {
    return _AppWidgetState();
  }
}

class _AppWidgetState extends State<AppWidget> {
  final List<String> images = [
    "https://cdna.artstation.com/p/assets/images/images/009/794/428/large/arnaud-kleindienst-spaceship3.jpg?1520945043",
    "https://cdnb.artstation.com/p/assets/covers/images/024/674/351/large/darko-darmar-markovic-b7.jpg?1583174193",
    "https://64.media.tumblr.com/875a3083ec9619f18479a3a3e72e2123/tumblr_p6gj47Kotd1vjjcaco1_640.png",
    "https://i.pinimg.com/736x/ec/02/87/ec0287615f3a6211c333f6dd675d4845.jpg",
    "https://i.pinimg.com/736x/d5/58/e7/d558e74fbec0db1a35398c58b118309f.jpg",
    "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/giant-space-station-orbiting-planet-earth-oliver-denker.jpg",
    "https://i.pinimg.com/originals/bd/1c/36/bd1c36ab867bce0ae9701d16dda93506.jpg",
    "https://i.pinimg.com/originals/61/fa/ac/61faac0f4dbf916fc8a733b9a2e166e7.png",
    "https://i.pinimg.com/originals/bd/1c/36/bd1c36ab867bce0ae9701d16dda93506.jpg",
    "https://i.pinimg.com/originals/54/70/d5/5470d50eb146e6e1276d66c12853694f.jpg"
  ];

  int index = 0;

  void _nextImage() {
    setState(() {
      index++;
      if (index == images.length) {
        index = 0;
      }
    });
  }

  void _resetPage() {
    setState(() {
      index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: SpaceWidget(images[index], _nextImage, _resetPage),
    );
  }
}

class SpaceWidget extends StatefulWidget {
  final String imageSrc;
  final VoidCallback nextImage;
  final VoidCallback resetPage;

  SpaceWidget(
    this.imageSrc,
    this.nextImage,
    this.resetPage,
  );

  @override
  _SpaceWidgetState createState() {
    return _SpaceWidgetState();
  }
}

class _SpaceWidgetState extends State<SpaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Space Images"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: widget.resetPage,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            widget.imageSrc,
            fit: BoxFit.cover,
            height: 550,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: RaisedButton(
              padding: EdgeInsets.all(10),
              child: Text('Next Image'),
              color: Theme.of(context).colorScheme.primary,
              onPressed: widget.nextImage,
            ),
          ),
        ],
      ),
    );
  }
}
