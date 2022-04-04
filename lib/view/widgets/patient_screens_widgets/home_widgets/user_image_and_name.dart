import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:psychology/services/firestore_methods.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/my_string.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class UserImageAndName extends StatelessWidget {
  String uid= GetStorage().read(KUid);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: StreamBuilder<DocumentSnapshot>(
        stream: FireStoreMethods().patients.doc(uid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          try {
            if (snapshot.hasData) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              return Row(
                children: [
                  ClipRRect(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45)),
                      child: Container(
                        height: SizeConfig.defaultSize! * 4,
                        width: SizeConfig.defaultSize! * 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            border: Border.all(
                              color: mainColor2,
                              width: 1.3,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(data["profileUrl"]),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KTextUtils(
                          text: "Hello,",
                          size: 18,
                          color: darkGrey,
                          fontWeight: FontWeight.w500,
                          textDecoration: TextDecoration.none),
                      KTextUtils(
                          text: data["displayName"],
                          size: 22,
                          color: darkGrey,
                          fontWeight: FontWeight.w600,
                          textDecoration: TextDecoration.none),
                    ],
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: SizedBox(),
              );
            } else {
              return SizedBox();
            }
          } catch (e) {
            return SizedBox();
          }
        },
      ),
    );
  }


}
