import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDatePicker extends StatelessWidget {
  final String label;
  final Rx<DateTime?> selectedDate;

  CustomDatePicker({required this.label, required this.selectedDate});

  Future<void> _pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: label,
            hintText: selectedDate.value?.toLocal().toString().split(' ')[0] ?? "Select Date",
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () => _pickDate(context),
            ),
          ),
          onTap: () => _pickDate(context),
        ));
  }
}
