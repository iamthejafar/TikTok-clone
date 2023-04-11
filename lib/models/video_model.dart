
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class VideoModel {
  String? id;
  String? username;
  String? uid;
  String? songname;
  String? caption;
  List? likes;
  int? commentCount;
  int? shareCount;
  String? videoUrl;
  String? thumbNail;
  String? profilephoto;

  VideoModel({
    this.id,
    this.username,
    this.uid,
    this.songname,
    this.caption,
    this.likes,
    this.commentCount,
    this.shareCount,
    this.videoUrl,
    this.thumbNail,
    this.profilephoto,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'uid': uid,
      'songname': songname,
      'caption': caption,
      'likes': likes,
      'commentCount': commentCount,
      'shareCount': shareCount,
      'videoUrl': videoUrl,
      'thumbNail': thumbNail,
      'profilephoto': profilephoto,
    };
  }

  static VideoModel fromSnap(DocumentSnapshot snap) {
    var map = snap.data() as Map<String, dynamic>;
    return VideoModel(
      id: map['id'] != null ? map['id'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      songname: map['songname'] != null ? map['songname'] as String : null,
      caption: map['caption'] != null ? map['caption'] as String : null,
      likes: map['likes'],
      commentCount:
          map['commentCount'] != null ? map['commentCount'] as int : null,
      shareCount: map['shareCount'] != null ? map['shareCount'] as int : null,
      videoUrl: map['videoUrl'] != null ? map['videoUrl'] as String : null,
      thumbNail: map['thumbNail'] != null ? map['thumbNail'] as String : null,
      profilephoto:
          map['profilephoto'] != null ? map['profilephoto'] as String : null,
    );
  }

  // factory VideoModel.fromMap(Map<String, dynamic> map) {
  //   return VideoModel(
  //     map['id'] != null ? map['id'] as String : null,
  //     map['username'] != null ? map['username'] as String : null,
  //     map['uid'] != null ? map['uid'] as String : null,
  //     map['songname'] != null ? map['songname'] as String : null,
  //     map['caption'] != null ? map['caption'] as String : null,
  //     map['likes'] != null ? map['likes'] as String : null,
  //     map['commentCount'] != null ? map['commentCount'] as int : null,
  //     map['shareCount'] != null ? map['shareCount'] as int : null,
  //     map['videoUrl'] != null ? map['videoUrl'] as String : null,
  //     map['thumbNail'] != null ? map['thumbNail'] as String : null,
  //     map['profilephoto'] != null ? map['profilephoto'] as String : null,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory VideoModel.fromJson(String source) =>
  // VideoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
