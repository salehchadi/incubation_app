import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  Custombutton({super.key, this.ontap,required this.text});
  VoidCallback? ontap;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
