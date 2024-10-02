import 'package:ensure/ensure_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

void main() async{
    await ScreenUtil.ensureScreenSize();
runApp( EnsureApp(appRouter: AppRouter(),));
}
