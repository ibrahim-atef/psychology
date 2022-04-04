import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/circule_image_avatar.dart';

class OnlineDoctorsChat extends StatelessWidget {
  const OnlineDoctorsChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.only(top: 10),
      height: SizeConfig.screenWidth! * .10,
      width: SizeConfig.screenWidth!,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,

        scrollDirection: Axis.horizontal,
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              CirculeImageAvatar(
                width: SizeConfig.defaultSize!*3.7,
                imageUrl:
                "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              ),
              Container(


                child: Positioned(
                    bottom:SizeConfig.defaultSize!*.1,
                    right: SizeConfig.defaultSize!*.1,
                    child: Container(decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                      child: CircleAvatar(
                        backgroundColor: Colors.green.shade300,
                        maxRadius: SizeConfig.defaultSize! * .4,
                      ),
                    )),
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: SizeConfig.defaultSize,
          );
        },
      ),
    );
  }
}
