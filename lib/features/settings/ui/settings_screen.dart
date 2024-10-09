import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/utils/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/display_app_name.dart';
import 'widgets/setting_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 32.h,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          const DisplayUserName(),
          24.ph,
          SettingItem(
            title: 'Profile',
            onTap: () {},
            widgetLeading: SvgPicture.asset(
              Assets.profileIcon,
              colorFilter: ColorFilter.mode(
                  IconTheme.of(context).color!, BlendMode.srcIn),
            ),
          ),
          16.ph,
          SettingItem(
            title: 'Dark Mode',
            onTap: () {},
            widgetLeading: const Icon(Icons.dark_mode_rounded),
          ),
          16.ph,
          SettingItem(
            title: 'Language',
            onTap: () {},
            widgetLeading: const Icon(Icons.language_rounded),
          ),
          16.ph,
          SettingItem(
            title: 'Notifications',
            onTap: () {},
            widgetLeading: const Icon(Icons.notifications_outlined),
          ),
          16.ph,
          SettingItem(
            title: 'About',
            onTap: () {},
            widgetLeading: const Icon(Icons.info_outline_rounded),
          ),
          16.ph,
          SettingItem(
            title: 'Help & Support',
            onTap: () {},
            widgetLeading: const Icon(Icons.help_outline_rounded),
          ),
          16.ph,
          SettingItem(
            title: 'Rate the app',
            onTap: () {},
            widgetLeading: const Icon(Icons.star_outline_rounded),
          ),
          16.ph,
          SettingItem(
            title: 'Privacy policy',
            onTap: () {},
            widgetLeading: const Icon(Icons.privacy_tip_rounded),
          ),
          16.ph,
          SettingItem(
            title: 'Logout',
            onTap: () {},
            widgetLeading: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
    );
  }
}
