import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';
import 'package:new_pro/common/theme_data.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.themeData(fontFamily: 'Poppins'),
    ),
  );
}
