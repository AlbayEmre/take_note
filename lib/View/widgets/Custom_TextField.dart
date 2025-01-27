import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:take_note/View/Project_Keys/Project_Padding.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.LeadingIchon = Icons.search,
    required this.controller,
  });
  IconData LeadingIchon;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: CustomPading.hight.value),
      // ignore: prefer_const_constructors
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            LeadingIchon,
            color: Colors.cyan,
          ),
          filled: true,
          fillColor: Colors.lightBlue[50],
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
