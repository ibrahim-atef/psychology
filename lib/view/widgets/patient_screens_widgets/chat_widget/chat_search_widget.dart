import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/utils/constants.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * .03),
      child: Container(alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 8),
          width: double.infinity,
          height: hight * .07,
          decoration: BoxDecoration(
              color: grey.withOpacity(.25),
              borderRadius: BorderRadius.circular(20)),
          child: TextField(
            onChanged: (value) {
              if (value != "") {}
            },
            cursorColor: Color(0xFF000000),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                // suffixIcon: controller.textEditingController.text == ""
                //     ? Text("")
                //     : IconButton(
                //         icon: Icon(
                //           Icons.clear,
                //           color: Colors.black54,
                //         ),
                //         onPressed: () {
                //           controller.clearSearch();
                //         },
                //       ),
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    // if (
                    // // controller.textEditingController.text != "") {
                    // //   controller.onSearchBtnClick();
                    // }
                  },
                ),
                hintText: "Search..",
                hintStyle: TextStyle(fontSize: 15,),
                border: InputBorder.none),
          )),
    );
  }
}
