import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class EbookPreviewPage extends StatefulWidget {
  const EbookPreviewPage({super.key});
  @override
  State<EbookPreviewPage> createState() => _FilePreviewPageState();
}
class _FilePreviewPageState extends State<EbookPreviewPage> {
  @override
  Widget build(BuildContext context) {
    String ebookUrl = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
          onPressed: () {
            NavigationHelper.pop();
          },
        ),
        title: const Text('书籍试读'),
        actions: const [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.print),
            onPressed: null,
          ),
        ],
      ),
      body: SfPdfViewer.network(ebookUrl),
    );
  }
}