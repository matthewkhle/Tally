import 'package:flutter/material.dart';

class ResetAllButton extends StatefulWidget {
  const ResetAllButton({Key? key}) : super(key: key);

  @override
  State<ResetAllButton> createState() => _ResetAllButtonState();
}

class _ResetAllButtonState extends State<ResetAllButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: IconButton(
          color: Colors.red,
          icon: Icon(Icons.restart_alt_outlined),
          onPressed: () {},
        ),
      ),
    );
  }
}
