import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/z_others/pdf_viewer.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: PDFScreen(),
    );
  }
}







