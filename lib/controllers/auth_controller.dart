import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktokclone/constants.dart';
import 'package:tiktokclone/models/user_model.dart';
import 'package:tiktokclone/views/screens/auth/login_screen.dart';
import 'package:tiktokclone/views/screens/auth/signup_screen.dart';
import 'package:tiktokclone/views/screens/home_screen.dart';


class AuthController extends GetxController{
  static AuthController instance = Get.find();

  late Rx<File?> _pickedImage;

  late Rx<User?> _user;

  User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user,_setInitialScreen);
  }

  _setInitialScreen(User? user){
    if(user==null){
      Get.offAll(()=>LoginScreen());
    }
    else{
      Get.offAll(()=>HomeScreen());
    }
  }

  File? get profilephoto => _pickedImage.value;

  void pickImage() async{
    final pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(pickImage!=null){
      Get.snackbar('Profile Picture', 'You have successfully selected an image.');
    }

    _pickedImage = Rx<File?>(File(pickImage!.path));

  }

  Future<String> _uploadToStorage(File image) async{
    Reference reference = await firebaseStorage
        .ref()
        .child('ProfilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = reference.putFile(image);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
  
  
  void registerUser({required String username, required String email, required String password, File? image}) async{
    try{
      if(username.isNotEmpty&&
      email.isNotEmpty&&
      password.isNotEmpty&&
      image!=null){
        UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

        String downloadUrl = await _uploadToStorage(image);

        UserModel userModel = UserModel(name: username, profilephoto: downloadUrl, email: email, uid: userCredential.user!.uid);
        
        await firestore.collection('users').doc(userCredential.user!.uid).set(userModel.toJson());
      }
      else{
        Get.snackbar('Error creating an account', 'Please Enter all fields');
      }
    } catch(e){
      Get.snackbar('Error creating an account', e.toString());
    }
  }



  void loginUser({required String email, required String password}) async{
    try{
      if(email.isNotEmpty&&
      password.isNotEmpty){
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        print('Logged in ');

      }
      else{
        Get.snackbar('Error Logging in.', 'Please Enter all fields');
      }
    }
    catch(e){
      Get.snackbar('Error Logging in.', e.toString());
    }
  }

}