part of "../AddTaskView.dart";

class _CustomLargeTextField extends StatelessWidget {
  _CustomLargeTextField({
    super.key,
    required this.controller,
  });
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPading.hight.paddingTop,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(
                Icons.text_snippet_rounded,
                color: Colors.cyan,
              ),
              fillColor: Colors.lightBlue[50],
              border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
            ),
            enabled: true,
            maxLines: 9,
            minLines: 1,
          );
        },
      ),
    );
  }
}
