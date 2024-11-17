import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/routing/routes.dart';
import 'package:ensure/core/theme/text_styles.dart';
import 'package:ensure/features/chat/domain/cubit/chat_cubit.dart';
import 'package:ensure/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';

class AddConversationItem extends StatelessWidget {
  final ProfileModel user;
  const AddConversationItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      onTap: () {
        context.read<ChatCubit>().addConversation(user.id).then((value) {
          if (!context.mounted) return;
          context.pushNamed(Routes.messages, arguments: {
            'profile': user,
            'conversationId': value
          });
        });
      },
      leading: Container(
        height: 50.h,
        width: 50.w,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          color: AppColors.teaRose,
          shape: BoxShape.circle,
        ),
        child: user.photoUrl != ''
            ? buildUserImage()
            : buildIconForEmptyUserImage(),
      ),
      title: Text(
        user.name,
        style: TextStyles.font15SemiBold,
      ),
      subtitle: Text(
        user.bio,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.font12LighterBrownBold,
      ),
    );
  }

  Icon buildIconForEmptyUserImage() {
    return const Icon(
              Icons.person,
              color: AppColors.white,
            );
  }

  Image buildUserImage() {
    return Image.network(
              user.photoUrl,
              fit: BoxFit.cover,
            );
  }
}
