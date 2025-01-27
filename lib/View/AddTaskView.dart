import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:take_note/Services/todo_Database.dart';
import 'package:take_note/View/Project_Keys/Project_Padding.dart';
import 'package:take_note/View/widgets/Custom_TextField.dart';

part 'widgets/Custom_Large_TextField.dart';
part 'widgets/Custom_ElevatedButton.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late TextEditingController _controller;
  late TextEditingController _Largecontroller;

  void SaveData() {
    Provider.of<DatabaseService>(context, listen: false).addTask(_Largecontroller.text, _controller.text);
    _Largecontroller.text = "";
    _controller.text = "";
    setState(() {});
  }

  @override
  void initState() {
    _controller = TextEditingController();
    _Largecontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _Largecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: CustomPading.medium.horizontalPadding,
        child: Column(
          children: [
            CustomTextField(
              LeadingIchon: Icons.text_fields_sharp,
              controller: _controller,
            ),
            _CustomLargeTextField(
              controller: _Largecontroller,
            ),
            _CustomEleveatedButton(
              onPressed: () {
                setState(() {
                  SaveData();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
