import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_binding.dart';
import 'common/common.dart';
import 'config/config.dart';
import 'routes/routes.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await AppPref.initListener();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log('state = $state');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppRoutes.splash,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: AppValues.appName,
      theme: CustomTheme.lightTheme,
      locale: const Locale('vi', 'VN'),
      translationsKeys: AppTranslation.translations,
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}
