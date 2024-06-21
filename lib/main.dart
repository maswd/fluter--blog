import 'package:blogclub/Article.dart';
import 'package:blogclub/carousel/carousel_slider.dart';
import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/profile.dart';
import 'package:blogclub/splash.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = "Avenir";
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const primaryColor = Color(0xff376AED);
    const secondaryTextColor = Color(0xff2D4379);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: primaryColor,
          ),
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
            background: Color(0xffFBFCFF),
            onBackground: primaryTextColor,
            onPrimary: Colors.white,
            surface: Colors.white,
            onSurface: primaryTextColor,
          ),
          appBarTheme: const AppBarTheme(
            titleSpacing: 32,
            backgroundColor: Colors.white,
            foregroundColor: primaryTextColor,
          ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: WidgetStateProperty.all(const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: defaultFontFamily)))),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontFamily: defaultFontFamily,
                color: secondaryTextColor,
                fontSize: 12),
            labelLarge: TextStyle(
                fontFamily: defaultFontFamily,
                color: secondaryTextColor,
                fontSize: 14),
            headlineSmall: TextStyle(
                fontFamily: defaultFontFamily,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: primaryTextColor),
            headlineLarge: TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: primaryTextColor,
            ),
            headlineMedium: TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontFamily: defaultFontFamily,
              color: primaryTextColor,
              fontSize: 10,
            ),
            labelSmall: TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: primaryTextColor,
            ),
          )),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(bottom: 0, left: 0, right: 0, child: _BottonNavigation())
      //   ],
      // ),
      home: const ProfileScreen(),
    );
  }
}

class _BottonNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: const Color(0x0ff9b487).withOpacity(0.3))
              ]),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                      iconFileName: 'Home',
                      activeIconFileName: 'Home',
                      title: "Home"),
                  BottomNavigationItem(
                      iconFileName: 'Articles',
                      activeIconFileName: 'Articles',
                      title: "Article"),
                  SizedBox(
                    width: 8,
                  ),
                  BottomNavigationItem(
                      iconFileName: 'Search',
                      activeIconFileName: 'Search',
                      title: "Search"),
                  BottomNavigationItem(
                      iconFileName: 'Menu',
                      activeIconFileName: 'Menu',
                      title: "Menu"),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                child: Image.asset('assets/img/icons/plus.png'),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    color: const Color(0xff376AED),
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;

  const BottomNavigationItem(
      {Key? key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconFileName.png'),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
