import 'package:flutter/material.dart';
import 'cashier_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Cashier App", home: const CashierPage());
  }
}
