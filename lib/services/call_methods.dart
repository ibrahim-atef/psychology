 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psychology/model/call_model.dart';

import '../utils/my_string.dart';


class CallMethods {
    CollectionReference callCollection =
  FirebaseFirestore.instance.collection(callsCollectionKey);



  Future<bool> makeCall({required Call  call}) async {
    try {
      call.hasDialled = true;
      Map<String, dynamic> hasDialledMap = call.toMap(call);

      call.hasDialled = false;
      Map<String, dynamic> hasNotDialledMap = call.toMap(call);

      await callCollection.doc(call.callerId).set (hasDialledMap);
      await callCollection.doc(call.receiverId).set (hasNotDialledMap);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> endCall({required Call  call}) async {
    try {
      await callCollection.doc(call.callerId).delete();
      await callCollection.doc(call.receiverId).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}