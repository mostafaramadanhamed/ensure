import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/bloc_observer.dart';
import 'package:ensure/core/utils/constants.dart';
import 'package:ensure/ensure_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';

/// The main function of the application.
///
/// This function does the following:
///
/// 1. Ensures the widgets binding is initialized.
/// 2. Ensures the screen size is initialized.
/// 3. Sets up the dependency injection.
/// 4. Initializes the easy localization.
/// 5. Sets the bloc observer.
/// 6. Checks if the user is logged in.
/// 7. Sets the default locale to 'en_US'.
/// 8. Runs the application with the easy localization wrapper.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await ScreenUtil.ensureScreenSize();
    await setupGetIt();
  await EasyLocalization.ensureInitialized();

    Bloc.observer = AppBlocObserver();

    await checkIfLoggedInUser();
    // for disabling date time localization
    // display date and time in english
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
