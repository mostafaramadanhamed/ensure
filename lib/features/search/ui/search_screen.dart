import 'package:ensure/core/widgets/app_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppTextFormField(
          hintText: 'Search',
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          onChanged: (p0) {},
          suffixIcon:
              IconButton(onPressed: () {}, icon: const Icon(Icons.clear)),
          maxLines: 1,
        ),
      ),
      
    );
  }
}
