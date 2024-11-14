import 'package:ensure/features/home/ui/widgets/bottom_nav_bar.dart';
import 'package:ensure/features/posts/ui/add_post.dart';
import 'package:ensure/features/posts/ui/posts_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../../settings/ui/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: const [
          PostsScreen(),
        
          AddPost(),
          SettingsScreen()
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInCubic,
            );
          });
        },
      ),
    );
  }
}
