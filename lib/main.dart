import 'package:flutter/material.dart';
import 'name_generator.dart';

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
              child: Column(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
