import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  CustomSearchTextField({Key? key, required this.controller, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the search field
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            blurRadius: 8, // Blur effect
            spreadRadius: 2, // Spread radius of the shadow
            offset: Offset(0, 4), // Position of the shadow
          ),
        ],
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width/2,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Search here...',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none, // Remove default border
            icon: Icon(
              Icons.search,
              color: Colors.green, // Search icon color
            ),
          ),
        ),
      ),
    );
  }
}
