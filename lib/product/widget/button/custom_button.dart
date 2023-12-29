import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final dynamic onPressed;
  final Color? color;
  const CommonButton(
      {Key? key, required this.text, required this.onPressed, this.color = Colors.amber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 48,
        width: 284,
        child: OutlinedButton(
          style: customButtonStyle,
          onPressed: onPressed,
          child: Text(text, style: Theme.of(context).textTheme.titleSmall),
        ),
      ),
    );
  }

  ButtonStyle get customButtonStyle => ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all(color),
      );
}
