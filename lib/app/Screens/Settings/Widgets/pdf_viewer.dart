import 'package:einayaaminah/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFScreen extends StatefulWidget {
  const PDFScreen({super.key});

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: Text(S.of(context).terms),
      ),
      body: SfPdfViewer.asset(
          'assets/pdfs/Terms and Conditions for Enaiah Amenh App.pdf'),
    );
  }
}
