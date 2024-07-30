// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/cart_model.dart';
import 'screens/home_page.dart';
import 'screens/cart_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'screens/seller_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Paint Shop',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey[900],
        scaffoldBackgroundColor: Colors.grey[900],
        cardColor: Colors.grey[800],
        dividerColor: Colors.grey[700],
        colorScheme: ColorScheme.dark(
          primary: Colors.blueGrey[900]!,
          secondary: Colors.yellow[700]!,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 14),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(color: Colors.white54),
          labelStyle: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[850],
          selectedItemColor: Colors.yellow[700],
          unselectedItemColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/cart': (context) => CartPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/seller': (context) => SellerDashboard(),
      },
    );
  }
}
