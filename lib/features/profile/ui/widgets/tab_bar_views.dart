

import 'package:flutter/material.dart';


class TabBarViews extends StatelessWidget {
  const TabBarViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      //  controller: _tabController,

      children: [
    
        Center(
          child: Text(
            'posts',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Center(
          child: Text(
            'Photos',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Center(
          child: Text(
            'Videos',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
