import 'package:ensure/bloc_observer.dart';
import 'package:ensure/core/utils/constants.dart';
import 'package:ensure/ensure_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
    await setupGetIt();

    Bloc.observer = AppBlocObserver();

    await checkIfLoggedInUser();

  
  runApp(EnsureApp(
    appRouter: AppRouter(),
  ));
}
