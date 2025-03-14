import 'package:flutter/material.dart';
import 'package:kon/widgets/custom_widgets/custom_text_field.dart';

class CustomDropdownList extends StatefulWidget {
  final List<String> items;
  final Function(String) onChanged;

  const CustomDropdownList({
    Key? key,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownListState createState() => _CustomDropdownListState();
}

class _CustomDropdownListState extends State<CustomDropdownList> {
  String? selectedValue;
  final TextEditingController otherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: selectedValue,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          items: widget.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList()
            ..add(
              const DropdownMenuItem<String>(
                value: 'Other',
                child: Text('Other'),
              ),
            ),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });

            if (value != 'Other') {
              widget.onChanged(value ?? '');
            }
          },
        ),
        const SizedBox(height: 16),
        if (selectedValue == 'Other')
        CustomTextField(
          hintText: 'Enter your custom option',
          controller: otherController,
          onChanged: (value) {
              widget.onChanged(value);
            },
        ),
      ],
    );
  }
}
