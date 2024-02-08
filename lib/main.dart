import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quadro/components/navbar.dart';
import 'package:quadro/login_system/auth_gate.dart';
import 'package:quadro/login_system/auth_service.dart';
import 'package:quadro/login_system/login_or_register.dart';
import 'package:quadro/screens/workshop_screen.dart';
import 'package:quadro/screens/workshops_screen.dart';
import 'package:quadro/store_system/cart-screen.dart';
import 'package:quadro/store_system/intro_page.dart';
import 'package:quadro/store_system/models/shop.dart';
import 'package:quadro/store_system/shop_screen.dart';
import 'package:quadro/themes/light_mode.dart';
import 'package:quadro/towing_user/request_towing.dart';
import 'package:quadro/workshop_user/workshop_home_screen.dart';
import '../firebase/firebase_options.dart';
import 'login_system/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => Shop()), // New ChangeNotifierProvider for Shop
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const AuthGate(),
      theme: lightMode,
      routes: {
        '/navbar': (context) => const NavBar(),
        '/intro_page': (context) => const IntroPage(),
        '/shop_screen': (context) => const ShopPage(),
        '/cart_screen': (context) => const CartPage(),
        '/workshop_home_screen': (context) =>  MyWorkShop(),
        '/request_towing': (context) =>  RequestTowingPage(),
        '/login_or_register': (context) =>  const LoginOrRegister(),
      },
    );
  }
}
