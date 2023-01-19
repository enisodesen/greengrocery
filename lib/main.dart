import 'package:flutter/material.dart';
import 'package:greengrocer/pages/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive/products.dart';
import 'hive/user.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserListAdapter());
  Hive.registerAdapter(ProductListAdapter());

  await Hive.openBox<UserList>('userBox');
  await Hive.openBox<ProductList>('productBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
