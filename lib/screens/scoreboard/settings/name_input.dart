import 'package:flutter/material.dart';
import 'package:tally/models/team.dart';

class NameInput extends StatefulWidget {
  final Team team;
  final Function onChange;

  const NameInput({Key? key, required this.team, required this.onChange})
      : super(key: key);

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.team.name;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _nameController,
        onChanged: (newName) {
          widget.onChange(
            widget.team.id,
            newName,
          );
        },
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: 'Team Name',
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 3,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 3,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          // fillColor: Colors.white,
        ),
      ),
    );
  }
}
