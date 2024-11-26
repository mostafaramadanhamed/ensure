import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/format_text_helper.dart';
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/selactable_expandable_text.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/posts/data/models/post_model.dart';
import 'package:ensure/features/posts/ui/widgets/reacts_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/cubit/posts_cubit.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  const PostItem({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.grey.shade300,
      color: Theme.of(context).cardColor,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      elevation: 8,
      shadowColor: AppColors.melon,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.ph,
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      Routes.profile,
                      arguments: post.authorId,
                    );
                  },
                  child:
                      Text(post.authorName, style: TextStyles.font15SemiBold)),
              leading: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          post.profilePic,
                        ),
                        fit: BoxFit.cover)),
              ),
              trailing: PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    context.read<PostsCubit>().isuser(post.authorId)
                        ? editPopupMenuItem(context)
                        : aboutPopupMenuItem(context),
                    context.read<PostsCubit>().isuser(post.authorId)
                        ? deletePopupMenuItem(context)
                        : unfollowPopupMenuItem(context),
                     reportPopupMenuItem(),
                  ];
                },
              ),
            ),
            20.ph,
            SelectableExpandableText(
             text:    formatText(post.text)
            ),
            6.ph,
            post.content == ''
                ? Container()
                : GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      Routes.displayImage,
                      arguments: post.content,
                    );
                  },
                  child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0.r),
                        child: Image.network(post.content,
                            width: double.infinity,
                            height: 180.h,
                            fit: BoxFit.cover),
                      ),
                    ),
                ),
            post.content == ''? 2.ph: 14.ph,
            ReactsBlocBuilder(post: post),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> reportPopupMenuItem() {
    return PopupMenuItem(
                    value: 'Report'.tr(),
                    child:
                        Text('Report'.tr(), style: const TextStyle(color: Colors.red)),
                  );
  }

  PopupMenuItem<String> unfollowPopupMenuItem(BuildContext context) {
    return PopupMenuItem(
                          value: 'Unfollow'.tr(),
                          child:  Text('Unfollow'.tr()),
                          onTap: () {
                            context.pushNamed(
                              Routes.profile,
                              arguments: post.authorId,
                            );
                          },
                        );
  }

  PopupMenuItem<String> deletePopupMenuItem(BuildContext context) {
    return PopupMenuItem(
                          value: 'Delete'.tr(),
                          child:  Text('Delete'.tr(),
                              style: const TextStyle(color: Colors.red)),
                          onTap: () {
                            context.read<PostsCubit>().deletePost(post.uId);
                            ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                content: Text('Post Deleted'.tr()),
                              ),
                            );
                          });
  }

  PopupMenuItem<String> aboutPopupMenuItem(BuildContext context) {
    return PopupMenuItem(
                          value: 'About this account'.tr(),
                          child:  Text('About this account'.tr()),
                          onTap: () {
                            context.pushNamed(
                              Routes.profile,
                              arguments: post.authorId,
                            );
                          },
                        );
  }

  PopupMenuItem<String> editPopupMenuItem(BuildContext context) {
    return PopupMenuItem(
                          value: 'Edit'.tr(),
                          child:  Text('Edit'.tr()),
                          onTap: () {
                            context.pushNamed(
                              Routes.editPost,
                              arguments: post,
                            );
                          },
                        );
  }
}

