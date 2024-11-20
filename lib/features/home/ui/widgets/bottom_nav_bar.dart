import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../../../../core/theme/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 0,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: WaterDropNavBar(
        bottomPadding: 16.h,
        inactiveIconColor: AppColors.lighterBrown,
        waterDropColor: AppColors.coralPink,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        onItemSelected: onItemSelected,
        selectedIndex: selectedIndex,
        iconSize: 30.sp,
        barItems: [
          BarItem(
            filledIcon: Icons.home_filled,
            outlinedIcon: Icons.home_outlined,
          ),
        BarItem(
            filledIcon: Icons.thumbs_up_down_rounded,
            outlinedIcon: Icons.thumbs_up_down_outlined,
          ),
     
          BarItem(
              filledIcon: Icons.add_box_rounded,
              outlinedIcon: Icons.add_box_outlined),
          BarItem(
              filledIcon: Icons.settings_rounded,
              outlinedIcon: Icons.settings_outlined),
        ],
      ),
    );
  }
}
