import 'package:flutter/material.dart';

class CustomTimeInputRow extends StatefulWidget {
  final List<String> units;
  final String initialUnit;
  final Function(int?, String) onChanged;

  const CustomTimeInputRow({
    Key? key,
    required this.units,
    this.initialUnit = 'Hour',
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomTimeInputRowState createState() => _CustomTimeInputRowState();
}

class _CustomTimeInputRowState extends State<CustomTimeInputRow> {
  final TextEditingController numberController = TextEditingController();
  late String selectedUnit;

  @override
  void initState() {
    super.initState();
    selectedUnit = widget.initialUnit;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Number Input Field
        Expanded(
          flex: 2,
          child: TextField(
            controller: numberController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter number',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green,width: 2),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            ),
            onChanged: (value) {
              int? number = int.tryParse(value);
              widget.onChanged(number, selectedUnit);
            },
          ),
        ),
        const SizedBox(width: 10),
        // Dropdown List
        Expanded(
          flex: 2,
          child: DropdownButtonFormField<String>(
            value: selectedUnit,
            decoration: const InputDecoration(
              labelText: 'Unit',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green,width: 2),
                borderRadius: BorderRadius.all(Radius.circular(20))
 
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            ),
            items: widget.units.map((String unit) {
              return DropdownMenuItem<String>(
                value: unit,
                child: Text(unit),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedUnit = value;
                });
                widget.onChanged(int.tryParse(numberController.text), value);
              }
            },
          ),
        ),
      ],
    );
  }
}
