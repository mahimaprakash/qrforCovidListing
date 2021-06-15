import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrGenerate extends StatelessWidget {
  const QrGenerate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: PrettyQr(
              data: "ABC Shop",
              size: MediaQuery.of(context).size.width * 0.8,
              roundEdges: true,
            ),
          ),
        ],
      ),
    );
  }
}
