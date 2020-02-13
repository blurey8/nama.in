import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  SwiperPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SwiperPageState createState() => new _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.yellow,
            child: Center(child: Text(index.toString())),
          );
        },
        loop: false,
        itemCount: 2,
        pagination: new SwiperPagination(),
      ),
    );
  }
}
