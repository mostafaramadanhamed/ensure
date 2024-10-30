import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/posts/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/date_time_format_helper.dart';
import '../../../../core/helpers/format_text_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class ProfilePostItem extends StatelessWidget {
  final PostModel post;
  const ProfilePostItem({super.key, required this.post});

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
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 0.h,
          bottom: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.ph,
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(post.authorName, style: TextStyles.font15SemiBold),
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
                    context.pushNamed(Routes.displayImage, arguments: post.content);
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
                    const Icon(
                        Icons.favorite,
                        
                        color: AppColors.coralPink,
                    ),
                    8.pw,
                   Text(
                            post.likes.toString(),
                            style: TextStyles.font12LighterBrownBold,
                          ),
                    8.pw,
                  const Icon(Icons.comment),
                    8.pw,
                   
                    post.comments == 0
                        ? Container()
                        : Text(
                            post.comments.toString(),
                            style: TextStyles.font12LighterBrownBold,
                          ),
                    8.pw,
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