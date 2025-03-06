import 'package:flutter/material.dart';

//////////////////////  CustomExpandableText  Widget //////////////////////////////

class CustomExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? style;

  const CustomExpandableText({
    required this.text,
    this.maxLines = 2,
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  _CustomExpandableTextState createState() => _CustomExpandableTextState();
}

class _CustomExpandableTextState extends State<CustomExpandableText> {
  bool isExpanded = false;
  bool isLongText = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkIfTextIsTooLong();
    });
  }

  void _checkIfTextIsTooLong() {
    final textSpan = TextSpan(text: widget.text, style: widget.style);
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);

    if (textPainter.didExceedMaxLines) {
      setState(() {
        isLongText = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: isExpanded ? null : widget.maxLines,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: widget.style,
        ),
        if (isLongText) // Show button only if text is too long
          TextButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(isExpanded ? "Show less" : "Show more"),
          ),
      ],
    );
  }
}

////////////////////// End CustomExpandableText  Widget //////////////////////////////
