import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'helper/name_generator.dart';
import 'helper/word_generator.dart';
import 'custom/custom_pagination.dart';

void main() => runApp(NamainApp());

class NamainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nama.in' ,
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

  SwiperPlugin controller = new SwiperControl();

  Widget buildSwiper({List<Widget> children}) {
    return new Swiper(
      key: Key('Swiper'),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: children[index],
        );
      },
      loop: false,
      itemCount: children.length,
      pagination: new SwiperPagination(builder: IconSwiperPaginationBuilder()),
      control: controller,
    );
  }

  // Widget buildPagination(BuildContext context) {
  //   // return new FlatButton(onPressed: controller., child: Icon(Icons.autorenew));
  // }

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
                if (nameController.text.isNotEmpty)
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
      childAspectRatio: 1,//5/4,
      
      primary: false,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: <Widget>[
        buildCategoryTile('Food', Icons.fastfood, Colors.red[700]),
        buildCategoryTile('eCommerce', Icons.shopping_cart, Colors.red[600]),
        buildCategoryTile('Agriculture', Icons.local_florist, Colors.red[500]),
        buildCategoryTile('Finance', Icons.attach_money, Colors.green[600]),
        buildCategoryTile('Media', Icons.live_tv, Colors.green[500]),
        buildCategoryTile('Social', Icons.people, Colors.green[400]),
        buildCategoryTile('Health', Icons.local_hospital, Colors.blue[500]),
        buildCategoryTile('Education', Icons.school, Colors.blue[400]),
        buildCategoryTile('Travel', Icons.directions_car, Colors.blue[300]),
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
