import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrGenerate extends StatelessWidget {
  const QrGenerate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrettyQr(
            data: "ABC Shop",
            size: 290.0,
            roundEdges: true,
          ),
        ],
      ),
    );
  }
}
