import 'package:beezone_delivery/widgets/home.dart';
import 'package:beezone_delivery/widgets/registration/code_page.dart';
import 'package:beezone_delivery/widgets/registration/phone_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Google Sans',
        backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
    ),
      initialRoute: '/registration_phone',
      routes: {
        '/registration_phone': (context) => const PhonePage(),
        '/registration_code': (context) => const CodePage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
