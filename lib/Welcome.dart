import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({Key? key}) : super(key: key);

  @override
  _Welcome_ScreenState createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {

  String? d1,d2;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text("welcome",style: TextStyle(fontSize: 35,color: Colors.brown),),
        ),
      ),
    );
  }
}
