import 'package:einayaaminah/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivceyState();
}

class _PrivceyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              backgroundColor, 
          title: Text(S.of(context).privacy),
        ),
        body: SfPdfViewer.asset(
            'assets/pdfs/Privacy Policy for Enyah Amenh App.pdf'));
  }
}
