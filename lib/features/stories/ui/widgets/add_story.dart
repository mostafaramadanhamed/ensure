import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';

class AddStory extends StatelessWidget {
  const AddStory({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
                radius: 35.r,
                backgroundColor: AppColors.oldRose,
                child: const Icon(
                  Icons.add_box_rounded,
                  color: Colors.white,
                ),
              );
  }
}