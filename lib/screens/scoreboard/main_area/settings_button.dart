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
        color: Colors.lightBlueAccent,
        textColor: Colors.white,
        child: const Icon(
          Icons.settings,
          size: 30,
        ),
        padding: const EdgeInsets.all(10),
        shape: const CircleBorder(),
      ),
    );
  }
}
