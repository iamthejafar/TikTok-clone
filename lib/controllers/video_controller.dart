import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/constants.dart';
import 'package:tiktokclone/models/video_model.dart';


class VideoController extends GetxController{
  final Rx<List<VideoModel>> _videoList = Rx<List<VideoModel>>([]);
  List<VideoModel> get videoList => _videoList.value;

  PageController pageController = PageController(initialPage: 0,viewportFraction:1);

  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(firestore.collection('videos').snapshots().map((QuerySnapshot querySnapshot){
      List<VideoModel> retVal = [];
      for(var element in querySnapshot.docs){
        retVal.add(VideoModel.fromSnap(element));
      }
      return retVal;
    }));
  }

  likeVideo(String id) async{
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if((doc.data()! as dynamic)['likes'].contains(uid)){
      await firestore.collection('videos').doc(id).update({
        'likes':FieldValue.arrayRemove([uid])
      });
    }
    else{
      await firestore.collection('videos').doc(id).update({
        'likes':FieldValue.arrayUnion([uid])
      });
    }
  }
}