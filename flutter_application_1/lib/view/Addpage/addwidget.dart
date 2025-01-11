import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
      
        color: const Color.fromARGB(255, 252, 187, 225),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.white,width: 2)
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: value,
        hint: Text(' $label'),
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

   Widget buildTextField( {required String label, 
  required  TextEditingController  controller,
    TextInputType? inputType,
  TextInputFormatter? formaters} ) {
    return TextFormField(
      controller: controller,
               keyboardType: inputType,
               
      decoration: InputDecoration(
        labelText: label,
    
        filled: true,
        fillColor: const Color.fromARGB(255, 252, 187, 225),
        contentPadding: EdgeInsets.all(20),
        border: InputBorder.none,
         
       enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0),  
        borderRadius: BorderRadius.circular(15), 
      ), 
      ),
      
    );
  }

