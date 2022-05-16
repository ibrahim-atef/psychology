import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
 import 'package:psychology/utils/styles.dart';

class ImageViewer extends StatelessWidget {
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            IconBroken.Arrow___Left_2,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: Get.width,
                  height: Get.height * .8,
                  child: PhotoView(
                    imageProvider: NetworkImage(imageUrl),
                    loadingBuilder: (context, progress) => Center(
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        child: SizedBox(
                          width: Get.width,
                          height: Get.width,
                          child: ClipRRect(
                            child: Image.asset("assets/images/l.gif"),
                          ),
                        ),
                      ),
                    ),
                  ))
              // SizedBox(width: Get.width,height: Get.width,
              //   child: ClipRRect(
              //     child: Hero(tag: "hero",
              //       child: FadeInImage.assetNetwork(
              //           fit: BoxFit.contain,
              //           placeholder: "assets/images/l.gif",
              //           image: imageUrl),
              //     ),
              //   ),
              // )
              ,
            ],
          ),
        ),
      ),
    );
  }

  ImageViewer({
    required this.imageUrl,
  });
}
