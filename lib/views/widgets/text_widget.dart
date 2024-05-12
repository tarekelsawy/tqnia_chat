import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int maxLines;
  final TextAlign textAlign;
  final BoxFit fit;
  const TextWidget(
      {super.key,
      required this.text,
      required this.style,
      this.maxLines = 1,
      this.textAlign = TextAlign.center,this.fit = BoxFit.fitWidth});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: fit,
      child: Text(
        text,
        style: style,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
      ),
    );
  }
}
class TextWidgetWithoutFit extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int maxLines;
  final TextAlign textAlign;
  const TextWidgetWithoutFit(
      {super.key,
      required this.text,
      required this.style,
      this.maxLines = 1,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
