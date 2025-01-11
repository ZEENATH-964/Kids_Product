 import 'package:flutter/material.dart';

Widget buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required double height,
    required double width,
  }) {
    return Container(
      height: height,
      width: width,
      
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 252, 187, 225),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.white, width: 2)),
      child: DropdownButton<String>(
        isExpanded: true,
        value: value,
        hint: Center(child: Text(' $label')),
        underline: SizedBox(),
        items: items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }




 Widget buildTextFormField(TextEditingController controller, String text) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 252, 187, 225),
        labelText: text,
      ),
      controller: controller,
    );
  }