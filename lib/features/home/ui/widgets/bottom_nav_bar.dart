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
            blurRadius: 15,
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
        inactiveIconColor: AppColors.lightMelon,
        waterDropColor: AppColors.coralPink,
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
        onItemSelected: onItemSelected,
        selectedIndex: selectedIndex,
        iconSize: 30.sp,
        barItems: [
          BarItem(
            filledIcon: Icons.home_filled,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
              filledIcon: Icons.smart_display_rounded,
              outlinedIcon: Icons.smart_display_outlined),
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