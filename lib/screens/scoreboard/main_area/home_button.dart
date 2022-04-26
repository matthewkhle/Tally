import 'package:flutter/material.dart';

class HomeButton extends StatefulWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        color: Colors.blue,
        textColor: Colors.white,
        child: Icon(
          Icons.home,
          size: 30,
        ),
        padding: EdgeInsets.all(10),
        shape: CircleBorder(),
      ),
    );
  }
}
