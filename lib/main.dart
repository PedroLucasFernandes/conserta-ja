import 'package:conserta_ja/pages/address_page.dart';
import 'package:conserta_ja/pages/documents_page.dart';
import 'package:conserta_ja/pages/email_login.dart';
import 'package:conserta_ja/pages/email_page.dart';
import 'package:conserta_ja/pages/email_signup.dart';
import 'package:conserta_ja/pages/home_page.dart';
import 'package:conserta_ja/pages/information_page.dart';
import 'package:conserta_ja/pages/login_page.dart';
import 'package:conserta_ja/pages/myprofile_page.dart';
import 'package:conserta_ja/pages/phone_login.dart';
import 'package:conserta_ja/pages/phone_page.dart';
import 'package:conserta_ja/pages/phone_signup.dart';
import 'package:flutter/material.dart';

void main () {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());  
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/login_page",
      routes: {
        "/login_page" : (context) => LoginPage(),
        "/email_page" : (context) => EmailPage(),
        "/email_signup" : (context) => EmailSignup(),
        "/email_login" : (context) => EmailLogin(),
        "/phone_page" : (context) => PhonePage(),
        "/phone_signup" : (context) => PhoneSignup(),
        "/phone_login" : (context) => PhoneLogin(),
        "/information_page" : (context) => InformationPage(),
        "/documents_page" : (context) => DocumentsPage(),
        "/home_page" : (context) => HomePage(),
        "/myprofile_page" : (context) => MyProfile(),
        "/address_page" : (context) => AddressPage(),
      },
      title: "Conserta Já!",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFCEA169,
            <int, Color>{
            50: Color(0xFFFFF8E1),
            100: Color(0xFFFFECB3),
            200: Color(0xFFFFE082),
            300: Color(0xFFFFD54F),
            400: Color(0xFFFFCA1A),
            500: Color(0xFFCEA169),
            600: Color(0xFFFFB547),
            700: Color(0xFFFFAD30),
            800: Color(0xFFFFA417),
            900: Color(0xFFFF9900),
          },),
      ),
      home: LoginPage(),
    );
  }
}