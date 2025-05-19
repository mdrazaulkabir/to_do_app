import 'package:flutter/material.dart';

class defaultWidget extends StatelessWidget {
  final Color color;
  const defaultWidget({super.key,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(offset: Offset(5, 5),color: Colors.yellowAccent)]
      ),
      child: Center(
        child: Text(
          "This page will be upadte very soon!",
          style: TextStyle(
              fontSize: 40,
              color: Colors.brown,
              backgroundColor: Colors.greenAccent),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
