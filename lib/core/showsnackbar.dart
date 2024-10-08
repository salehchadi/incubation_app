import 'package:flutter/material.dart';

void showsnackbar(BuildContext context, String meessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(meessage),
      ),
    );
  }