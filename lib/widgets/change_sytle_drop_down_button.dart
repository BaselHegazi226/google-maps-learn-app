import 'package:flutter/material.dart';

class ChangeStyleDropdownButton extends StatefulWidget {
  const ChangeStyleDropdownButton({
    super.key,
    required this.items,
    this.borderColor = const Color(0xffF1F1F1),
    this.backgroundColor = Colors.white,
    this.textColor = Colors.blue,
    this.iconColor = Colors.blue,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 16,
    this.onChanged,
    required this.dropdownValue,
  });
  final List<String> items;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final FontWeight fontWeight;
  final double fontSize;
  final void Function(String?)? onChanged;
  final String dropdownValue;

  @override
  State<ChangeStyleDropdownButton> createState() =>
      _ChangeStyleDropdownButtonState();
}

class _ChangeStyleDropdownButtonState extends State<ChangeStyleDropdownButton> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border.all(color: widget.borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        underline: const SizedBox(),
        isExpanded: true,
        isDense: true,
        value: widget.dropdownValue,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        icon: Icon(
          Icons.arrow_drop_down,
          weight: 400,
          size: screenWidth < 350 ? 16 : 28,
          color: widget.iconColor,
        ),
        style: TextStyle(
          fontSize: widget.fontSize,
          color: widget.textColor,
          fontWeight: widget.fontWeight,
        ),
        onChanged: widget.onChanged,
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: CustomDrowDownItem(text: value),
          );
        }).toList(),
        selectedItemBuilder: (context) {
          return widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: CustomDrowDownItem(text: value),
            );
          }).toList();
        },
      ),
    );
  }
}

class CustomDrowDownItem extends StatelessWidget {
  const CustomDrowDownItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
