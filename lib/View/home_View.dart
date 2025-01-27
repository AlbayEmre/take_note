import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:take_note/Services/todo_Database.dart';
import 'package:take_note/View/AddTaskView.dart';
import 'package:take_note/View/Project_Keys/Project_Padding.dart';
import 'package:take_note/View/widgets/Custom_TextField.dart';

part 'widgets/Cutom_GridView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late TextEditingController _controller;

  void NavigatedScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddTask(), //Late Upgrade
      ),
    );
  }

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0, 0.4, 0.6, 1.0], //Hangi kısmlara kadar hengisi olsun (Yularıdan aşağı doğru )
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blueGrey.withOpacity(0.3),
                  Colors.white,
                  Colors.white,
                  Colors.blueGrey.withOpacity(0.3),
                ],
              ),
            ),
          ),
          Padding(
            padding: CustomPading.low.horizontalPadding,
            child: Column(
              children: [
                Row(
                  //Change Theme
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                Padding(
                  padding: EdgeInsets.only(top: CustomPading.hight.value),
                  child: CustomTextField(
                    controller: _controller,
                  ),
                ),
                _CustomGridView(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.lightBlue[50],
        child: Icon(
          Icons.add,
        ),
        onPressed: () => NavigatedScreen(),
      ),
    );
  }
}
