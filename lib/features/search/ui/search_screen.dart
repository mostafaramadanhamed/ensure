import 'package:ensure/core/widgets/app_text_filed.dart';
import 'package:ensure/features/chat/ui/widgets/shimmer_conversation_loading.dart';
import 'package:ensure/features/search/ui/widgets/searched_users_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/text_styles.dart';
import '../domain/cubit/search_cubit.dart';
import '../domain/cubit/search_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppTextFormField(
            hintText: 'Search',
            controller: context.read<SearchCubit>().searchController,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            onChanged: (query) {
              context.read<SearchCubit>().getSearchData();
            },
            suffixIcon: IconButton(
                onPressed: () {
                  context.read<SearchCubit>().searchController.clear();
                },
                icon: const Icon(Icons.clear)),
            maxLines: 1,
          ),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return const ShimmerConversationLoading();
            } else if (state is SearchLoaded) {
              if (state.data.isNotEmpty) {
                return SearchedUsersListView(users: state.data);
              } else {
                return Center(
                  child: Text(
                    'User not found',
                    style: TextStyles.font17SemiBold,
                  ),
                );
              }
            } else if (state is SearchError) {
              return Center(
                child: Text(state.message),
              );
            }

            return const SizedBox.shrink();
          },
        ));
  }
}
