
import 'package:ensure/core/routing/app_router.dart';
import 'package:ensure/core/routing/routes.dart';
import 'package:flutter/material.dart';

class EnsureApp extends StatelessWidget {
  final AppRouter appRouter ;
  const EnsureApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.initial,
      onGenerateRoute: appRouter.onGenerateRoute,
     // home: Text( 'Flutter Demo Home Page'),
    );
  }
}
