import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'name_generator.dart';
import 'word_generator.dart';

void main() => runApp(NamainApp());

class NamainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nama.in',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.teal[50],
      ),
      home: NameGenerator(),
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
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: children[index],
        );
      },
      loop: false,
      itemCount: children.length,
      pagination: new SwiperPagination(),
    );
  }
  Widget buildStartupName() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          this.startupName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
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
          ),
        ),
        SizedBox(height: 10.0),
        RaisedButton(
            child: Text('Generate'),
            color: Theme.of(context).primaryColor,
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

  Widget buildCategoryTile(String categoryName, IconData icon, Color color) {
    return RaisedButton(
      color: color,
      textColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      onPressed: () {
        setState(() {
          this.startupName = generateName(getWordByCategory(categoryName));
        });
        print(this.startupName);
        print(categoryName + ' pressed!');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon),
          Text(
            categoryName,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildCategoryTiles() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 5/4,
      
      primary: false,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: <Widget>[
        buildCategoryTile('Food', Icons.fastfood, Colors.red),
        buildCategoryTile('eCommerce', Icons.shopping_cart, Colors.red),
        buildCategoryTile('Agriculture', Icons.local_florist, Colors.red),
        buildCategoryTile('Finance', Icons.attach_money, Colors.green),
        buildCategoryTile('Media', Icons.live_tv, Colors.green),
        buildCategoryTile('Social', Icons.people, Colors.green),
        buildCategoryTile('Health', Icons.local_hospital, Colors.blue),
        buildCategoryTile('Education', Icons.school, Colors.blue),
        buildCategoryTile('Travel', Icons.directions_car, Colors.blue),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nama.in - Startup Name Generator'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            // flex: 4,
            child: buildStartupName()
          ),
          Expanded(
            // flex: 5,
            child: buildSwiper(
                children: <Widget>[buildTextForm(), buildCategoryTiles()]),
          ),
        ],
      ),
    );
  }
}
