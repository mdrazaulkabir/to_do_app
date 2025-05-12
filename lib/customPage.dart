import 'package:flutter/material.dart';

class customPage extends StatefulWidget {
  const customPage({super.key});

  @override
  State<customPage> createState() => _customPageState();
}

class _customPageState extends State<customPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This page will be upadte very soon!",
          style: TextStyle(fontSize: 40, color: Colors.brown,backgroundColor: Colors.greenAccent),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
