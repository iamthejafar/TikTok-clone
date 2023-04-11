

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String name;
  String profilephoto;
  String email;
  String uid;

  UserModel({
    required this.name,
    required this.profilephoto,
    required this.email,
    required this.uid
  });

  Map<String,dynamic> toJson() =>{
    "name":name,
    "profilephoto":profilephoto,
    "email":email,
    "uid":uid
  };

  static UserModel fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;
    return UserModel(name: snapshot['email'], profilephoto: snapshot['profilephoto'], email: snapshot['email'], uid: snapshot['uid']);
  }

}