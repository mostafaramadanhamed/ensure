import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/widgets/app_text_filed.dart';
import 'package:ensure/features/login/ui/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override

  /// The main screen for the login feature.
  ///
  /// This widget is a [Scaffold] that has a [CustomScrollView] as its body.
  /// The [CustomScrollView] contains two [Sliver]s: an [SliverAppBar] and a
  /// [SliverList].
  ///
  /// The [SliverAppBar] is used to display the app's title and a background.
  /// The background is a [TopContainer] widget that displays a gradient and
  /// a rounded rectangle.
  ///
  /// The [SliverList] is used to display the login form. The form is wrapped
  /// in a [Padding] widget to add some space around it.
  ///
  /// The login form is a [LoginForm] widget that contains two [AppTextFormField]s
  /// and two [TextButton]s.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /// The app bar that displays the app's title and a background.
          SliverAppBar(
            /// The height of the app bar.
            expandedHeight: 240.h,

            /// The background of the app bar.
            flexibleSpace: FlexibleSpaceBar(

                /// The title of the app bar.
                centerTitle: true,

                /// The padding of the title.
                titlePadding: EdgeInsets.only(bottom: 60.h),

                /// The title of the app bar.
                title: Text(
                  "Login".tr(),

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

                  /// The login form.
                  child: const LoginForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
