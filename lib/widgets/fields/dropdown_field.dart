import 'package:flutter/material.dart';
import 'package:pocketjob/utils/texts.dart';

class CustomDropDownField extends StatefulWidget {
  final List<String> list;
  final String label;
  String? current;
  final IconData icon;
  final ValueChanged<String?>? onChanged; // Add a callback parameter

  CustomDropDownField({
    super.key,
    required this.list,
    required this.label,
    required this.icon,
    required this.current,
    this.onChanged, // Initialize the callback parameter
  });

  @override
  State<CustomDropDownField> createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  @override
  void initState() {
    super.initState();
    if (widget.current != null && !widget.list.contains(widget.current)) {
      widget.current = null; // Reset current if it's not a valid value
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: heading2(),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 60,
          child: DropdownButtonFormField<String>(
            value: widget.current != "" ? widget.current : null,
            itemHeight: 55,
            items: widget.list
                .map((g) => DropdownMenuItem(child: Text(g), value: g))
                .toList(),
            onChanged: (value) {
              setState(() {
                widget.current = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value); // Trigger the callback
              }
            },
            icon: Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).primaryColor,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(69, 212, 210, 210),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(
                widget.icon,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}