import 'dart:developer';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class EasyPdfViewerExample extends StatefulWidget {
  const EasyPdfViewerExample({Key? key}) : super(key: key);

  @override
  EasyPdfViewerExampleState createState() => EasyPdfViewerExampleState();
}

class EasyPdfViewerExampleState extends State<EasyPdfViewerExample> {
  late Future<PDFDocument> pdfFuture;

  @override
  void initState() {
    super.initState();
    pdfFuture = loadPDFDocument();
  }

  Future<PDFDocument> loadPDFDocument() async {
    try {
      return PDFDocument.fromAsset('images/big-o-cheatsheet.pdf');
    } catch (e) {
      log('Error loading PDF: $e');
      // Handle the error, e.g., show a message to the user
      rethrow; // Rethrow the error to mark the Future as completed with an error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: FutureBuilder<PDFDocument>(
        future: pdfFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading PDF'));
          } else {
            return Center(child: PDFViewer(document: snapshot.data!));
          }
        },
      ),
    );
  }
}
