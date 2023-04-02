import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktokclone/views/screens/add_video_screen.dart';
import 'package:tiktokclone/views/screens/video_screen.dart';


import './controllers/auth_controller.dart';

var pages = [
  VideoScreen(),
  Text('Search Screen'),
  AddVideoSceen(),
  Text('Message '),
  Text('Profile')
];

const kbackgroundColor = Colors.black;
var kbuttonColor = Colors.red[400];
const kborderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
//
// CONTROLLER
var authController = AuthController.instance;