import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMessageCard extends StatelessWidget {
  const MyMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.centerEnd,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth:0.75.sw,
            minWidth:0.35.sw,
            minHeight:0.06.sh,
          ),
          child: Card(
            elevation: 3,
            color: Colors.blue,
            margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(12.r),
                topEnd: Radius.circular(12.r),
                bottomStart:
                 Radius.circular(12.r),
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Text(
                'This is my message',
               
                
              ),
            ),
          ),
        ));
  }
}
