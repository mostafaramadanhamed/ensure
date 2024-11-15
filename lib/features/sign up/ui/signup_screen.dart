import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../login/ui/widgets/top_container.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override

  /// Builds the UI of the signup screen.
  ///
  /// The UI consists of an app bar with a title "Ensure" and a background
  /// with a logo and a gradient, and a list that contains the signup form.
  ///
  /// The app bar is a [SliverAppBar] with an [expandedHeight] of 180.h.
  /// The [flexibleSpace] is a [FlexibleSpaceBar] with a [centerTitle] of
  /// true, a [titlePadding] of 60.h, and a [background] of a [TopContainer].
  ///
  /// The list is a [SliverList] with a [delegate] of a [SliverChildListDelegate]
  /// that contains a padding of 40.h and a [Padding] with a padding of 24.w
  /// and a [SignupForm] as its child.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /// The app bar that displays the app's title and a background.
          SliverAppBar(
            /// The height of the app bar.
            expandedHeight: 180.h,

            /// The background of the app bar.
            flexibleSpace: FlexibleSpaceBar(

                /// The title of the app bar.
                centerTitle: true,

                /// The padding of the title.
                titlePadding: EdgeInsets.only(bottom: 60.h),

                /// The title of the app bar.
                title: Text(
                  "Sign Up".tr(),

                  /// The style of the title.
                  style: TextStyles.font28Bold.copyWith(
                    color: AppColors.white
                          ),
                ),

                /// The background of the app bar.
                background: const TopContainer()),
          ),

          /// The list that contains the login form.
          SliverList(
            /// The delegate of the list.
            delegate: SliverChildListDelegate(
              [
                /// The padding of the list.
                40.ph,

                /// The padding around the login form.
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),

                  /// The signup form.
                  child: const SignupForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
