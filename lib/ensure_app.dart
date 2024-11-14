import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/routing/app_router.dart';
import 'package:ensure/core/routing/routes.dart';
import 'package:ensure/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/custom_theme.dart';

class EnsureApp extends StatelessWidget {
  final AppRouter appRouter;
  const EnsureApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(398, 852),
      minTextAdapt: true,
      child: MaterialApp(
        theme: CustomTheme.lightThemeData(context),
        darkTheme: CustomTheme.darkThemeData(),
        // themeMode: ThemeMode.dark,  
          localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
       
        initialRoute: isLoggedInUser?Routes.home:Routes.onBoarding,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
