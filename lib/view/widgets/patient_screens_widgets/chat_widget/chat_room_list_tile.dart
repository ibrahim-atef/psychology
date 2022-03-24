import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psychology/utils/size_config.dart';

class ChatRoomListTil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Row(
          children: [
            Container(
              height: SizeConfig.defaultSize!*4.2,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/psychology-4ee11.appspot.com/o/patients%2FS3rpSpYU4hSPClFNUhtTQ4R4msw2%2Fimage_picker4772500994258809599.jpg?alt=media&token=bef859d3-6d79-4c1e-8894-0b5030cb3e8e",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.defaultSize!*.5,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ibrahim Atef",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  "widget.lastMessagewidget.lastMessagewidget.lastMessage",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis, color: Colors.black54),maxLines: 2,
                ),
              ],
            )),
            SizedBox(
              width: SizeConfig.defaultSize,
            ),
            Container(
              child: Text(
                "09:05",
                //   "${DateFormat.jm().format(widget.lastMessageTime.toDate()).toString()}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
