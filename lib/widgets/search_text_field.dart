import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;

  SearchTextField(this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: new InputDecoration(
        contentPadding: const EdgeInsets.all(14),
        border: new OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: 'Search here...',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
