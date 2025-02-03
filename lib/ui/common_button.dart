import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget{
  final String title;
  Color? textColor;
  Color? buttonColor;
  final VoidCallback onTap;

  CommonButton({
    super.key,
    required this.title,
    this.textColor = Colors.black,
    this.buttonColor = Colors.greenAccent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontFamily: "content",
          fontSize: 20,
        ),
      ),
    );
  }
}

