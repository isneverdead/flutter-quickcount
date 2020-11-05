import 'dart:io';
import 'dart:typed_data';

// import 'package:esys_flutter_share/esys_flutter_share.dart';
import '../pages/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../providers/data_tps.dart';

class PreviewPage extends StatefulWidget {
  final String imgPath;

  PreviewPage({this.imgPath});

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    final upload = Provider.of<DataTPS>(context);
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      // ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.file(
                File(widget.imgPath),
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60.0,
                color: Colors.black,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          upload.setImagePath(File(widget.imgPath));
                          Navigator.of(context)
                              .pushReplacementNamed(InputPage.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<ByteData> getBytesFromFile() async {
    Uint8List bytes = File(widget.imgPath).readAsBytesSync() as Uint8List;
    return ByteData.view(bytes.buffer);
  }
}
