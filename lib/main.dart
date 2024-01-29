import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:innovation/cache/app_storage.dart';
import 'bindings/app_binding.dart';
import 'routes/get_pages.dart';
import 'routes/route_helper.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(
    const Duration(milliseconds: 1500),
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icon color
    systemNavigationBarIconBrightness:
        Brightness.dark, // color of navigation controls
  ));
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    AppStorage().init()
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    GetStorage.init();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Innovation App",
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: RouteHelper.splash,
      getPages: AppPages.pages,
    );
  }
}
