import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/posts/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/date_time_format_helper.dart';
import '../../../../core/helpers/format_text_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../posts/domain/cubit/posts_cubit.dart';
import '../../domain/cubit/profile_cubit.dart';

class ProfilePostItem extends StatelessWidget {
  final PostModel post;
  final String userId;
  const ProfilePostItem({super.key, required this.post, required this.userId});

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
                        ? PopupMenuItem(
                            value: 'Edit'.tr(),
                            child:  Text('Edit'.tr()),
                            onTap: () {
                              context.pushNamed(
                                Routes.editPost,
                                arguments: post,
                              );
                            },
                          )
                        : PopupMenuItem(
                            value: 'About this account'.tr(),
                            child: const Text(''),
                            onTap: () {
                              
                            }
                          ),
                    context.read<PostsCubit>().isuser(post.authorId)
                        ? PopupMenuItem(
                            value: 'Delete'.tr(),
                            child:  Text('Delete'.tr(),
                                style: TextStyle(color: Colors.red)),
                            onTap: () {
                              context.read<PostsCubit>().deletePost(post.uId);
                              context.read<ProfileCubit>().getPostsByUserId(
                                  post.authorId);
                              ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                  content: Text('Post Deleted'.tr()),
                                ),
                              );
                            })
                        : 
                        PopupMenuItem(
                            value: 'About this account'.tr(),
                            child:  Text('About this account'.tr()),
                            onTap: () {
                             
                            },
                          ),
                     PopupMenuItem(
                      value: 'Report'.tr(),
                      child:
                          Text('Report'.tr(), style: TextStyle(color: Colors.red)),
                    ),
                  ];
                },
              ),
            ),
            20.ph,
            GestureDetector(
              onTap: () {},
              child: Text(
                formatText(post.text),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font15SemiBold,
              ),
            ),
            20.ph,
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
            14.ph,
          Row(
                  children: [
                    IconButton(
                      onPressed: ()  {
                    
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                   Text(
                            post.likes.toString(),
                            style: TextStyles.font12LighterBrownBold,
                          ),
                    8.ph,
                    IconButton(
                      onPressed: () {
                        context.pushNamed(Routes.comments, arguments: post.uId);

                        context.read<PostsCubit>().getPosts(); // Refresh posts
                      },
                      icon: const Icon(Icons.comment),
                    ),
                     Text(
                            post.comments.toString(),
                            style: TextStyles.font12LighterBrownBold,
                          ),
                    8.ph,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                    ),
                    const Spacer(),
                    Text(
                      formatPostTime(post.creatdAt),
                      style: TextStyles.font12LighterBrownBold,
                    ),
                  ],
              
              
            ),
          ],
        ),
      ),
    );
   }
}