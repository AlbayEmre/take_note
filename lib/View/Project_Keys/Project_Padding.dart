import 'package:flutter/cupertino.dart';

enum CustomPading {
  low(10),

  medium(20),

  hight(30);

  final double value;

  const CustomPading(this.value);

  EdgeInsets get padding => EdgeInsets.all(value);
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: value);
  EdgeInsets get paddingTop => EdgeInsets.only(top: value);
  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: value);
  // ignore: non_constant_identifier_names
  EdgeInsets get VerticalPadding => EdgeInsets.symmetric(vertical: value);
}
