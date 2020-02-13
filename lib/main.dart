import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'try_swiper.dart';
import 'name_generator.dart';
import 'word_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green[50],
      ),
      home: NameGenerator(),
      // home: SwiperPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class NameGenerator extends StatefulWidget {
  @override
  NameGeneratorState createState() => NameGeneratorState();
}

class NameGeneratorState extends State<NameGenerator> {
  String startupName = 'Your Startup Name';
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Widget buildCarousel() {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "http://via.placeholder.com/350x150",
          fit: BoxFit.fill,
        );
      },
      itemCount: 3,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
    );
  }

  Widget buildSwiper({List<Widget> children}) {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          // color: Colors.yellow,
          child: children[index],
          // child: Center(child: Text(index.toString())),
        );
      },
      loop: false,
      itemCount: children.length,
      pagination: new SwiperPagination(),
    );
  }

  Widget buildTextForm() {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: nameController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Enter any words',
            // focusColor: Colors.yellow,
          ),
        ),
        SizedBox(height: 10.0),
        RaisedButton(
            child: Text('Generate'),
            color: Colors.green,
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                this.startupName = generateName(nameController.text);
              });
              print(this.startupName);
            }),
      ],
    );
  }

  Widget buildCategoryTile(String categoryName, Color color) {
    return RaisedButton(
      color: color,
      textColor: Colors.white,
      onPressed: () {
        setState(() {
          this.startupName = generateName(
            getWordByCategory(categoryName)
          );
        });
        print(this.startupName);
        print(categoryName + ' pressed!');
      },
      child: Text(
        categoryName,
        textAlign: TextAlign.center,
      ),
    );
  }

  // Health, Finance, Education
  // Food, Transportation, eCommerce
  // Media, Social, Agriculture
  Widget buildCategoryTiles() {
    return GridView.count(
      crossAxisCount: 3,
      primary: false,
      // padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: <Widget>[
        buildCategoryTile('Food', Colors.red[600]),
        buildCategoryTile('eCommerce', Colors.red[500]),
        buildCategoryTile('Agriculture', Colors.red[400]),
        buildCategoryTile('Finance', Colors.green[600]),
        buildCategoryTile('Media', Colors.green[500]),
        buildCategoryTile('Social', Colors.green[400]),
        buildCategoryTile('Health', Colors.blue[600]),
        buildCategoryTile('Education', Colors.blue[500]),
        buildCategoryTile('Transportation', Colors.blue[400]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  this.startupName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // backgroundColor: Colors.yellow,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              // child: buildTextForm(),
              // child: buildCategoryTiles(),
              child: buildSwiper(
                  children: <Widget>[buildTextForm(), buildCategoryTiles()]),
            ),
          ],
        ),
      ),
    );
  }
}
