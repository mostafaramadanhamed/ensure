import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
 StoryController controller=StoryController();
  List<StoryItem>storyItems=[];

  @override
  void initState() {
    super.initState();
    initStoryPage();
  }
  void initStoryPage(){
    // for(int i=0;i<widget.status.photoUrl.length;i++){

    // }
      storyItems.add(
        StoryItem.pageImage(url:'https://picsum.photos/600/800',
            controller: controller,),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: storyItems.isEmpty? const CircularProgressIndicator():StoryView(
        storyItems: storyItems, controller: controller,
        onVerticalSwipeComplete: (direction){
          if(direction==Direction.down){
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}