import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool useBlackButton;

  const Button({
    required this.text,
    this.onTap,
    this.useBlackButton = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 86,
        height: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: useBlackButton ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: useBlackButton ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
