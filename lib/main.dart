import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/constant_color.dart';
import 'package:portfolio/constants/constant_page.dart';
import 'package:portfolio/constants/constant_size.dart';
import 'package:portfolio/controllers/controller_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: ConstantColor.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
              horizontal: ConstantSize.x3,
              vertical: ConstantSize.x2,
            )),
          ),
        ),
      ),
      initialRoute: '/',
      initialBinding: BindingsBuilder(() {
        Get.put(ControllerLayout());
      }),
      getPages: [
        for (var m in ConstantPage.pages)
          GetPage(
            name: m.route,
            page: () => m.page,
            transition: Transition.cupertino,
          )
      ],
    );
  }
}
