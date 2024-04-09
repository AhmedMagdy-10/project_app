import 'package:flutter/material.dart';

String? token;
const kprimaryColor = Color(0xff164863);
const primaryColor = Color(0xff2B475E);
const chatMassage = Color(0xff006D84);

List<Color> kColors = const [
  Color.fromARGB(255, 74, 172, 49),
  Color.fromARGB(255, 229, 99, 82),
  Color.fromARGB(255, 17, 100, 209),
  Color(0xff537D8D),
  Color(0xffD9E76C),
];

//  Color(0xff100B20);
//  Color(0xff100B20);
// const secondColor = Color(0xff164863);

const secondColor = Color(0xffd82d53);

ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kprimaryColor,
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: Colors.blue,
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //       statusBarColor: Colors.blue, statusBarBrightness: Brightness.light),
    //   titleTextStyle: TextStyle(
    //     fontSize: 12,
    //     fontWeight: FontWeight.w700,
    //     color: Colors.black,
    //   ),
    //   iconTheme: IconThemeData(
    //     color: Colors.black,
    //   ),
    //   elevation: 0.0,
    // ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    ),
    colorScheme: const ColorScheme.highContrastDark(
      background: Colors.blue,
      secondary: Colors.blue,
    ),
    buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue, // Customize the button color
        textTheme: ButtonTextTheme.primary // Customize the button text color
        ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue,
      elevation: 20,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey[600],
      selectedLabelStyle: const TextStyle(
        color: Colors.blue,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.grey,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.red,
    ));
