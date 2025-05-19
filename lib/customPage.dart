import 'package:flutter/material.dart';
import 'package:to_do_app/defalutWidget.dart';

class customPage extends StatefulWidget {
  const customPage({super.key});

  @override
  State<customPage> createState() => _customPageState();
}

class _customPageState extends State<customPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "This is deafalut page",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.yellowAccent,
                shadows: [BoxShadow(offset: Offset(3, 3))]),
          ),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          bottom: TabBar(tabs:[
            Tab(text: "Home ",icon: Icon(Icons.home_filled),),
            Tab(text: "Online",icon: Icon(Icons.sell),),
            Tab(text: "Offline",icon: Icon(Icons.offline_bolt_outlined),)
          ]),
        ),
        body: TabBarView(children: [
          defaultWidget(color:Colors.red,),
          defaultWidget(color: Colors.greenAccent,),
          defaultWidget(color: Colors.blue,),
        ]),


        // body: Center(
        //   child: Text(
        //     "This page will be upadte very soon!",
        //     style: TextStyle(
        //         fontSize: 40,
        //         color: Colors.brown,
        //         backgroundColor: Colors.greenAccent),
        //     textAlign: TextAlign.center,
        //   ),
        // ),
      ),
    );
  }
}
