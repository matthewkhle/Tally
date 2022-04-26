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
        color: Colors.lightBlueAccent,
        textColor: Colors.white,
        child: const Icon(
          Icons.home,
          size: 30,
        ),
        padding: const EdgeInsets.all(10),
        shape: const CircleBorder(),
      ),
    );
  }
}
