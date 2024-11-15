import 'package:easy_localization/easy_localization.dart';
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
  await EasyLocalization.ensureInitialized();

    Bloc.observer = AppBlocObserver();

    await checkIfLoggedInUser();
    Intl.defaultLocale = 'en_US';

  
  runApp(EasyLocalization(
     
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const  Locale('en', 'US'),
    child: EnsureApp(
      appRouter: AppRouter(),
    ),
  ));
}
