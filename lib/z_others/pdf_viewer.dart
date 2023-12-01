import 'dart:developer';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PDFScreen extends StatefulWidget {
  const PDFScreen({Key? key}) : super(key: key);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  late Future<PDFDocument> pdfFuture;

  @override
  void initState() {
    super.initState();
    pdfFuture = loadPDFDocument();
  }

  Future<PDFDocument> loadPDFDocument() async {
    try {
      return PDFDocument.fromAsset('images/Mingourol.pdf');
    } catch (e) {
      log('Error loading PDF: $e');
      // Handle the error, e.g., show a message to the user
      throw e; // Rethrow the error to mark the Future as completed with an error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: FutureBuilder<PDFDocument>(
        future: pdfFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading PDF'));
          } else {
            return Center(child: PDFViewer(document: snapshot.data!));
          }
        },
      ),
    );
  }
}
