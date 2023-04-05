import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CommentModel {
  String username;
  String comment;
  final datePublished;
  List likes;
  String profilephoto;
  String uid;
  String id;

  CommentModel({
    required this.username,
    required this.comment,
    required this.likes,
    required this.profilephoto,
    required this.uid,
    required this.id,
    required this.datePublished
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'comment': comment,
      'likes': likes,
      'profilephoto': profilephoto,
      'uid': uid,
      'id': id,
      'datePublished': datePublished
    };
  }

  static CommentModel fromSnap(DocumentSnapshot snap) {
    var map = snap.data() as Map<String, dynamic>;
    return CommentModel(
      username: map['username'] as String,
      comment: map['comment'] as String,
      likes: map['likes'],
      profilephoto: map['profilephoto'] as String,
      uid: map['uid'] as String,
      id: map['id'] as String,
      datePublished:  map['datePublished']
    );
  }
}
