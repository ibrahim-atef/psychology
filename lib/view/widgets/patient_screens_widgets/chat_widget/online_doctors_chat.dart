import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/circule_image_avatar.dart';

class OnlineDoctorsChat extends StatelessWidget {
  const OnlineDoctorsChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: SizeConfig.defaultSize! * 5,
      width: SizeConfig.screenWidth!,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              CirculeImageAvatar(
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/psychology-4ee11.appspot.com/o/patients%2FS3rpSpYU4hSPClFNUhtTQ4R4msw2%2Fimage_picker4772500994258809599.jpg?alt=media&token=bef859d3-6d79-4c1e-8894-0b5030cb3e8e',
              ),
              Container(


                child: Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                      child: CircleAvatar(
                        backgroundColor: Colors.green.shade300,
                        maxRadius: SizeConfig.defaultSize! * .45,
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
