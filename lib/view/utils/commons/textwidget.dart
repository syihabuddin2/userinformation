import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  double? txtHeight;
  double? txtWidth;
  double scale;
  MainAxisAlignment mainAxis;
  String? label;
  Color? color;
  TextAlign? textAlign;
  TextDecoration? textDecoration;
  FontWeight? fontWeight;

  TextWidget({
    Key? key,
    this.txtHeight,
    this.txtWidth,
    required this.scale,
    required this.mainAxis,
    this.label,
    this.color,
    this.textAlign,
    this.textDecoration,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: txtHeight!,
        child: Row(
          mainAxisAlignment: mainAxis,
          children: [
            SizedBox(
              height: txtHeight! * scale,
              child: FittedBox(
                child: Text(
                  "$label",
                  textAlign: textAlign,
                  style: TextStyle(
                    color: color,
                    decoration: textDecoration,
                    fontWeight:
                        fontWeight != null ? fontWeight! : FontWeight.normal,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
