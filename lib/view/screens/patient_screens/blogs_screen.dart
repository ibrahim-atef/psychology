import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/screens/call_screens/answer_call/answer_call_wrap_layout.dart';
import '../../../controller/controllers/patient_controller/patient_home_screen_controller.dart';
import '../../../utils/constants.dart';
import '../../widgets/utils_widgets/text_utils.dart';
import 'blog_details_screen.dart';

class BlogsScreen extends StatelessWidget {
  final controller = Get.put(PatientHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return AnswerCallWrapLayout(
      scaffold: Scaffold(
        backgroundColor: homeBackGroundColor,
        appBar: AppBar(
          elevation: 2,
          leadingWidth: 0,
          leading: SizedBox(
            width: 0,
          ),
          backgroundColor: mainColor2,
          title: KTextUtils(
              text: "Blogs",
              size: 25,
              color: white,
              fontWeight: FontWeight.bold,
              textDecoration: TextDecoration.none),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Obx(
            () {
              return controller.blogsList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: mainColor2,
                          ),
                          KTextUtils(
                              text: "There's no blogs",
                              size: 20,
                              color: black,
                              fontWeight: FontWeight.bold,
                              textDecoration: TextDecoration.none)
                        ],
                      ),
                    )
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ArticlrContainer(
                          controller.blogsList[index].imageUrl.toString(),
                          controller.blogsList[index].title.toString(),
                          controller.blogsList[index].body.toString(),
                          controller.blogsList[index].blogOwnerId.toString(),

                          controller.blogsIdList[index].toString(),
                        );
                      },
                      itemCount: controller.blogsList.length,
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget ArticlrContainer(image, title, body, blogOwnerId,blogId) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! * .25,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Get.to(() => BlogDetailScreen(),
              arguments: [image, title, body, blogOwnerId,blogId]);
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage.assetNetwork(
                  height: SizeConfig.screenHeight! * .25,
                  width: SizeConfig.screenWidth,
                  placeholder: "assets/animations/loading.gif",
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: SizeConfig.screenHeight! * .05,
                  width: SizeConfig.width,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15))),
                  child: Text(
                    title,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 18,
                        color: white,
                        fontWeight: FontWeight.w900,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
