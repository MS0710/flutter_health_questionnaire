import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridButtonView extends StatefulWidget{
  String content;
  final VoidCallback onTap;

  GridButtonView({
    super.key,
    required this.content,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GridButtonView();
  }

}

class _GridButtonView extends State<GridButtonView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 151, 203, 241),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          widget.content,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontFamily: "content"
          ),
        ),
      ),
    );
  }

}