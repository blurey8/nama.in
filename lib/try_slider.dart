import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nama_in/main%20copy.dart';
import 'main.dart';

final items = [1, 2].map((i) {
  return Builder(
    builder: (BuildContext context) {
      return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(color: Colors.amber),
          child: Text(
            'text $i',
            style: TextStyle(fontSize: 16.0),
          ));
    },
  );
}).toList();

//Button controlled carousel
Widget buttonDemo() {
  final basicSlider = CarouselSlider(
    items: [],
    autoPlay: false,
    enlargeCenterPage: true,
    viewportFraction: 0.9,
    aspectRatio: 2.0,
  );
  return Column(children: [
    basicSlider,
    Row(children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: RaisedButton(
            onPressed: () => basicSlider.previousPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear),
            child: Text('prev slider'),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: RaisedButton(
            onPressed: () => basicSlider.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear),
            child: Text('next slider'),
          ),
        ),
      ),
    ]),
  ]);
}
