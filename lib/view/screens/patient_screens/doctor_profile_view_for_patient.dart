import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/patient_home_screen_controller.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/circule_image_avatar.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/reviews_and_sissions_widget.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/tabs_widgets.dart';
import 'package:psychology/view/widgets/utils_widgets/height_size_box.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class DoctorProfileViewForPatient extends StatelessWidget {
  DoctorProfileViewForPatient({Key? key}) : super(key: key);
  String uid = Get.arguments[0];
  String imageUrl = Get.arguments[1];
  String name = Get.arguments[2];
  String description = Get.arguments[3];
  final controller = Get.find<PatientHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackGroundColor,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: SizeConfig.defaultSize! * 17.2,
                decoration: buildBoxDecoration(),
                child: Column(
                  children: [
                    HeightSizeBox(SizeConfig.defaultSize! * 2.5),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(padding: EdgeInsets.zero,alignment: Alignment.topLeft,
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: black,
                                  size: SizeConfig.screenWidth!*.035,
                                )),
                          ],
                        ),
                        SizedBox(width: SizeConfig.screenWidth!*.1,),
                        Container(
                            height: SizeConfig.screenWidth! * .12,
                            width: SizeConfig.screenWidth! * .12,
                            child: CirculeImageAvatar(imageUrl: imageUrl, width: SizeConfig.defaultSize!*4,)),
                      ],
                    ),
                    HeightSizeBox(SizeConfig.defaultSize! * .5),
                    KTextUtils(
                        text: "Dr." + name,
                        size: 21,
                        color: black,
                        fontWeight: FontWeight.w800,
                        textDecoration: TextDecoration.none),
                    HeightSizeBox(SizeConfig.defaultSize! * 1.5),
                    ReviewsAndSissions(),
                    HeightSizeBox(SizeConfig.defaultSize! * 1),
                    Tabs()
                  ],
                ),
              ),
            ),)];
          },
          body:  GetBuilder<PatientHomeScreenController>(
            builder: (_) {
              return TabBarView(children: controller.tabScreens);
            },
          ) ,


        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          height: SizeConfig.screenHeight! * .06,
          width: SizeConfig.screenWidth! * .3,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: mainColor2,
            // gradient: LinearGradient(
            //   colors: [
            //     mainColor2,
            //     // Color(0xffcc6213),
            //     // Color(0xffba0b08),
            //     // Color(0xff931c04),
            //     // Color(0xff3f0303),
            //   ],
            // ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              "Book Now",
              style: TextStyle(
                  fontSize: 22,
                  color: white,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 6,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    );
  }
}
