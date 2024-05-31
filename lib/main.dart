import 'package:flutter/material.dart';
import 'package:flutter_sushi_ui/model/shop.dart';
import 'package:flutter_sushi_ui/pages/cart_screen.dart';
import 'package:provider/provider.dart';
import 'pages/intro_screen.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Shop(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            //backgroundColor: Colors.,
            //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: {
            '/login-screen': (context) => const IntroScreen(),
            '/menu-screen': (context) => const MenuScreen(),
            '/cart-screen': (context) => const CartScreen(),
          },
          home: const IntroScreen()),
    );
  }
}
