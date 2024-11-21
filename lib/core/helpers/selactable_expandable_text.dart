import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class SelectableExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  const SelectableExpandableText({
    super.key,
    required this.text,
    this.maxLines = 3,
  });

  @override
  State<SelectableExpandableText> createState() => _SelectableExpandableTextState();
}

class _SelectableExpandableTextState extends State<SelectableExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText.rich(
          TextSpan(
            text: widget.text,
          ),
          maxLines: isExpanded ? null : widget.maxLines,
          style:TextStyles.font15SemiBold,
        ),
    if (widget.text.length > 100)    GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'Show less'.tr() : 'Read more'.tr(),
            style: TextStyles.font15Regular,
          ),
        ),
      ],
    );
  }
}