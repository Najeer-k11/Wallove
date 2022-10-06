import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class WpScreen extends StatelessWidget {
  final String url;
  final String name;
  final String durl;

  const WpScreen({
    Key? key,
    required this.url,
    required this.name,
    required this.durl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Center(child: CircularProgressIndicator()),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white.withAlpha(0)),
                height: MediaQuery.of(context).size.height * 0.05,
                width: 100,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ElevatedButton(
                    onPressed: () {
                      _imageDownload();
                      final snackbr = ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text("your wallpaper is downloading"),)
                      );
                    },
                    child: const Text('Download')),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _imageDownload() async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(durl,
          destination: AndroidDestinationType.directoryPictures
            ..subDirectory("/Wallove/$name.png"));
      if (imageId == null) {
        return;
      }
    } on PlatformException catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }
}
