import 'package:flutter/material.dart';
import 'package:workshop4/screen/addform.dart';
import 'package:workshop4/screen/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // เริ่มต้นที่หน้ารายการอาหาร
      initialRoute: '/',
      routes: {
        '/': (context) => const Item(),
        '/add': (context) => const AddForm(),
      },
    );
  }
}