import 'package:flutter/material.dart';
import 'package:tally/models/color_map.dart';
import 'package:tally/models/team.dart';

class ColorPicker extends StatefulWidget {
  final Team team;
  final Function onChange;

  const ColorPicker({Key? key, required this.team, required this.onChange})
      : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late CustomColorObject _selectedColor =
      getCustomColorObject(widget.team.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[900],
        ),
        child: DropdownButton<CustomColorObject>(
          value: _selectedColor,
          items: customColorObjects.map((CustomColorObject value) {
            return DropdownMenuItem<CustomColorObject>(
                value: value,
                child: Row(
                  children: [
                    Container(
                      height: 25.0,
                      width: 25.0,
                      color: value.materialColor,
                    ),
                    Text(
                      " ${value.string}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ));
          }).toList(),
          onChanged: (newColor) {
            widget.onChange(
              widget.team.id,
              newColor?.string,
            );
            setState(() {
              _selectedColor = newColor!;
            });
          },
        ),
      ),
    );
  }
}
