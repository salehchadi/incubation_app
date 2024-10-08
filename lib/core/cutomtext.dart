import 'package:flutter/material.dart';

class customtextfield extends StatelessWidget {
  customtextfield(
      {super.key,
      this.onchanged,
      this.hinttext,
      this.labeltext,
      this.perfixicon,
      this.suffixicon,  this.obsecure=false});
  Function(String)? onchanged;
  final bool obsecure;

  @override
  String? hinttext;
  String? labeltext;
  Icon? perfixicon;
  Icon? suffixicon;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: obsecure,
        style: TextStyle(
          color: Colors.white,
        ),
        validator: (value) {
          if (value!.isEmpty) return 'please fill your email and password';
        },
        onChanged: onchanged,
        decoration: InputDecoration(
          suffixIcon: suffixicon,
          prefixIcon: perfixicon,
          // prefixIcon: Icon(
          // //   Icons.email,
          // //   color: Colors.white,
          // // ),
          contentPadding: EdgeInsets.all(16),
          border: OutlineInputBorder(),
          hintText: hinttext,
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
          label: Text(
            labeltext??'',
          ),
          labelStyle: TextStyle(
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
