import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:salesapp/routes.dart';

import 'app.dart';
import 'my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_)
  {
  });
// GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: App.appTitle,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: MyTheme.primaryColor1,
      //  unselectedWidgetColor: Colors.blue,
      ),
      initialRoute: Routes.login,
      getPages: Routes.routes,
    ),
  );
}