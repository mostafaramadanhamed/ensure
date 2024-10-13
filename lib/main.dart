import 'package:ensure/ensure_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
    await setupGetIt();

  
  runApp(EnsureApp(
    appRouter: AppRouter(),
  ));
}
