
import 'package:ensure/core/routing/app_router.dart';
import 'package:ensure/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnsureApp extends StatelessWidget {
  final AppRouter appRouter ;
  const EnsureApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
         designSize: const Size(398, 852),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoarding,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
