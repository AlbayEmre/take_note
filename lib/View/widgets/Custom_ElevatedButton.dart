part of "../AddTaskView.dart";

class _CustomEleveatedButton extends StatelessWidget {
  _CustomEleveatedButton({super.key, required this.onPressed});

  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return EdgeInsets.symmetric(horizontal: 30);
          }
          return null;
        }),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.lightBlue;
            }
            return Colors.deepOrangeAccent;
          },
        ),
      ),
      onPressed: onPressed,
      child: Text("Save"),
    );
  }
}
