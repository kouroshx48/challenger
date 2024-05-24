import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDropDown<T> extends StatefulWidget {
  const MyDropDown({super.key, required this.dropDownItems, required this.onValueChange});

  final List<dynamic> dropDownItems;
  final Function(void) onValueChange;


  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  late var _currentValue = widget.dropDownItems.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      icon: const Icon(
        CupertinoIcons.chevron_down,
        size: 18,
        weight: 700,
      ),

      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
        filled: true,
        fillColor: Colors.grey[300],
      ),
      value: _currentValue,
      items: widget.dropDownItems.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value!),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _currentValue = value;
          widget.onValueChange(value);
        });
      },
      style: TextStyle(
          color: Colors.grey[700], fontSize: 15, fontWeight: FontWeight.bold),
      dropdownColor: Colors.grey[500],
      elevation: 0,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
