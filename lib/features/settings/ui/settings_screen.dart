import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/shared_pref_helper.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/routing/routes.dart';
import 'package:ensure/core/utils/assets_paths.dart';
import 'package:ensure/features/posts/domain/cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../posts/domain/cubit/posts_state.dart';
import 'widgets/display_app_name.dart';
import 'widgets/setting_item.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<PostsCubit>().getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 32.h,
      ),
      child: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is GetUserDetailsSuccess) {
            return ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                DisplayUserName(
                  user: state.user 
                ),
                24.ph,
                SettingItem(
                  title: 'Profile',
                  onTap: () {
                    context.pushNamed(
                      Routes.profile,
                      arguments: state.user['user_id'],
                    );
                    
                  },
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
                  title: 'Privacy Policy',
                  onTap: () {},
                  widgetLeading: const Icon(Icons.privacy_tip_rounded),
                ),
                16.ph,
                SettingItem(
                  title: 'Logout',
                  onTap: () async {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title:  Text('Logout'.tr()),
                            content:
                                 Text('Are you sure you want to logout?'.tr()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child:  Text('No'.tr()),
                              ),
                              TextButton(
                                onPressed: () async {
                                  context.read<PostsCubit>().logout();
                                  SharedPrefHelper.clearAllSecuredData();
                                  context.pushReplacementNamed(Routes.login);
                                },
                                child:  Text('Yes'.tr()),
                              ),
                            ],
                          );
                        });
                  },
                  widgetLeading: const Icon(Icons.logout_rounded),
                ),
              ],
            );
          }
          if (state is GetUserDetailsError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
