import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/search/data/models/search_model.dart';
import 'package:ensure/features/search/ui/widgets/searched_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchedUsersListView extends StatelessWidget {
  final List<SearchModel> users;
  const SearchedUsersListView({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: users.length,
      itemBuilder: (context, index) => SearchedUserItem(user: users[index]),
      separatorBuilder: (context, index) => 16.ph,
    );
  }
}
