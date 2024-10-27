import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/sign%20up/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../domain/cubit/setup_profile_cubit.dart';

class SetupProfileScreen extends StatelessWidget {
  final UserModel user;
  const SetupProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupProfileCubit, SetupProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Photo'),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              TextButton(
                onPressed: () {
                  context.read<SetupProfileCubit>().setProfile();
                  context.pushNamed(Routes.home);
                },
                child: Text(
                    context.read<SetupProfileCubit>().image != null
                        ? 'Next'
                        : 'Skip',
                    style: TextStyles.font15SemiBold),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              children: [
                150.ph,
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 150.h,
                        width: 150.w,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: AppColors.teaRose,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.mistyRose,
                              blurRadius: 7.r,
                              offset: const Offset(0, 3),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: context.read<SetupProfileCubit>().image != null
                            ? Image.file(
                                context.read<SetupProfileCubit>().image!,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.person_outline_sharp,
                                size: 75.r,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                      ),
                      Positioned(
                        bottom: -8.h,
                        right: -4.w,
                        child: IconButton(
                          onPressed: () {
                            context
                                .read<SetupProfileCubit>()
                                .selectImage(context);
                          },
                          icon: Icon(
                            Icons.add_a_photo_rounded,
                            color: AppColors.oldRose,
                            size: 32.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
