import "package:flutter/material.dart";

class SettingsButton extends StatefulWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/scoreboard_settings');
        },
        color: Colors.blue,
        textColor: Colors.white,
        child: Icon(
          Icons.settings,
          size: 30,
        ),
        padding: EdgeInsets.all(10),
        shape: CircleBorder(),
      ),
    );
  }
}
