/*import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sionech_assignment_app/app/modules/view/home_screen.dart';
import 'package:sionech_assignment_app/app/utils/theme.dart';

Future<void> main() async {
  runApp(
    /*DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp()
    )*/
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          //useInheritedMediaQuery: true, // comment this if you want to disable DevicePreview entirely on debug
          //locale: DevicePreview.locale(context), // comment this if you want to disable DevicePreview entirely on debug
          //builder: DevicePreview.appBuilder, // comment this if you want to disable DevicePreview entirely on debug
          title: 'Sionech Assignment',
          theme: MyTheme.lightTheme(context),
          home: const HomeScreen(),
        );
      },
    );
  }
}

