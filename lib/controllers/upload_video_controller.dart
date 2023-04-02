import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/constants.dart';
import 'package:tiktokclone/models/video_model.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  _compressVideo(String videopath) async {
    var compressedVideo = await VideoCompress.compressVideo(videopath,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videopath) async {
    Reference reference = firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask = reference.putFile(await _compressVideo(videopath));
    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> _uploadImageToStorage(String id, String videopath) async {
    Reference reference = firebaseStorage.ref().child('thumbnail').child(id);
    UploadTask uploadTask = reference.putFile(await _getThumbnail(videopath));
    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnail(String videopath) async {
    final thumbNail = await VideoCompress.getFileThumbnail(videopath);
    return thumbNail;
  }

  uploadVideo(String songname, String caption, String videopath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();

      var allDocs = await firestore.collection('videos').get();

      int len = allDocs.docs.length;

      String videoUrl = await _uploadVideoToStorage("Video $len", videopath);
      String thumbNailUrl =
          await _uploadImageToStorage('video $len', videopath);
      VideoModel videoModel = VideoModel(
          uid: uid,
          username: (userDoc.data()! as Map<String, dynamic>)['name'],
          id: "video $len",
          likes: [],
          commentCount: 0,
          shareCount: 0,
          songname: songname,
          caption: caption,
          videoUrl: videoUrl,
          profilephoto:
              (userDoc.data()! as Map<String, dynamic>)['profilephoto'],
          thumbNail: thumbNailUrl);
      await firestore
          .collection('videos')
          .doc('video $len')
          .set(videoModel.toMap())
          .then((value) => Get.back());
    } catch (e) {
      Get.snackbar('Error Uploading Video', e.toString());
    }
  }
}
