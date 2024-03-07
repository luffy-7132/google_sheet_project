import 'package:flutter/material.dart';

mTextField(TextEditingController controller, String text) {
  return TextField(
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.purpleAccent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.purple),
      ),
      hintText: text,
    ),
    controller: controller,
  );
}
