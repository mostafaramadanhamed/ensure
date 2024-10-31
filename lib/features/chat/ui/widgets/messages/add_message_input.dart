import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/widgets/app_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';

class AddMessageInput extends StatelessWidget {
  const AddMessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
        child: Row(
          children: [
            const Expanded(
              child: 
                   AppTextFormField(
                    hintText: "Enter your message",
                                   ),
                
            ),
            
            16.pw,
            const Icon(
              Icons.send_outlined,
              color: AppColors.coralPink,
            ),
        
        ]
        ),
      )
      ],
    );
  }
}
