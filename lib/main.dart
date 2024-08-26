import 'package:flutter/material.dart';
import 'package:pls_work/pages/home.dart';

class myClass extends StatelessWidget {
  const myClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: homePage()
    );
  }
}

void main(){
  runApp(myClass());
}
