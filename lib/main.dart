import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dashboard_page.dart';
import 'home_page.dart';
import 'product_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
          child: HomePage(),
        ),
        routes: {
          '/dashboard': (context) => DashboardPage(),
          '/products': (context) => ProductsPage(),
        }
    );
  }
}
