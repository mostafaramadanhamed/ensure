
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
class OrRow extends StatelessWidget {
  const OrRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            endIndent: 10,
            indent: 10,
            thickness: 2,
            color: AppColors.teaRose,
          ),
        ),
        Text(
          'OR',
          style: TextStyles.font15Regular,
        ),
        const Expanded(
          child: Divider(
            endIndent: 10,
            indent: 10,
            thickness: 2,
            color: AppColors.teaRose,
          ),
        ),
      ],
    );
  }
}
