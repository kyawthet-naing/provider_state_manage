import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state/screens/home.dart';
import 'package:flutter_state/screens/product_screen_1.dart';
import 'package:flutter_state/screens/product_screen_2.dart';
import 'package:flutter_state/screens/shopping_cart.dart';
import 'package:flutter_state/state_manage/shirt_data.dart';
import 'package:flutter_state/utils/route_name.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShirtCart>(
      create: (_) => ShirtCart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlatState',
        routes: {
          home: (context) => Home(),
          product1: (context) => ProductScreen1(),
          product2: (context) => ProductScreen2(),
          cart: (context) => ShoppingCart(),
        },
      ),
    );
  }
}
