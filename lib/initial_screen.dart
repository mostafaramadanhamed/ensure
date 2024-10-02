


// import 'dart:math' as math;

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sleek_circular_slider/sleek_circular_slider.dart';
// import 'package:task_ease/core/routing/routing_extension.dart';

// import '../../core/routing/routes.dart';
// import '../../core/styles/colors.dart';


// class LoadingScreen extends StatelessWidget {
//   const LoadingScreen({super.key});
//   @override
//   Widget build(BuildContext context) {

//     Future.delayed(const Duration(milliseconds: 2200)).whenComplete(()async{
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       if( prefs.getInt("firstTime")==null){
//         if (!context.mounted) return;
//         context.pushReplacementNamed(Routes.onBoardingScreen);
//         prefs.setInt("firstTime",1);
//       }
//       else{
//         if (!context.mounted) return;
//         context.pushReplacementNamed(Routes.homeScreen);
//       }
//     });

//     return  const Scaffold(
//       body: Center(
//           child: Circle()
//       ),
//     );
//   }
// }

// class Circle extends StatefulWidget {
//   const Circle({
//     super.key,
//   });

//   @override
//   State<Circle> createState() => _CircleState();
// }

// class _CircleState extends State<Circle> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();

//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _controller.dispose();
//     super.dispose();

//   }
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (_, child) {
//         return Transform.rotate(
//           angle: _controller.value * 2 * math.pi,
//           child:  SleekCircularSlider(

//             innerWidget: (double d)=>const Text(""),
//             initialValue: 24,

//             appearance: CircularSliderAppearance(
//                 spinnerMode: true,
//                 animationEnabled: false,
//                 customWidths: CustomSliderWidths(
//                     trackWidth: 12,
//                     progressBarWidth: 7,
//                   handlerSize: 15,
//                 ),
//                 customColors: CustomSliderColors(
//                   progressBarColor: ColorsManager.kPrimaryColor,
//                   dotColor:ColorsManager.kPrimaryLightColor.withOpacity(0.8),
//                   trackColor: ColorsManager.kPrimaryLightColor.withOpacity(0.5),
//                 )
//         ),
//           ),
//         );
//       },
//     );
//   }
// }

