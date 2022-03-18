import 'package:flutter/cupertino.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/home_widgets/home_screen_doctor_container_bocking.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class MoreTherapistsGridViewWidget extends StatelessWidget {
  const MoreTherapistsGridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: SizeConfig.defaultSize! * 1.3,
          width: SizeConfig.screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              KTextUtils(
                  text: "More Therapists",
                  size: SizeConfig.defaultSize! * 1.05,
                  color: black,
                  fontWeight: FontWeight.w800,
                  textDecoration: TextDecoration.none),
            ],
          ),
        ),
        SizedBox(
          height: 1,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * .05,
          child: Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                //     childAspectRatio: 1, maxCrossAxisExtent: 200),
                itemBuilder: (context, index) {
                  return HomeScreenDoctorContainerBocking();
                }),
          ),
        )
      ],
    );
  }
}
