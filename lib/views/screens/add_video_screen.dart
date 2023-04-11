import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktokclone/constants.dart';

import 'confirm_screen.dart';



class AddVideoSceen extends StatelessWidget {
  const AddVideoSceen({Key? key}) : super(key: key);


  pickVideo(ImageSource src, BuildContext context) async{
    final video = await ImagePicker().pickVideo(source: src);
    if(video!=null){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ConfirmScreen(videoFile: File(video.path),videoPath: video.path,)));
    }
  }

  showOptionDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context)=>SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: (){
                pickVideo(ImageSource.gallery, context);

              },
              child: Row(
                children: const[
                  Icon(Icons.image),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Gallery',
                    style: TextStyle(
                      fontSize: 20
                    ),
                    ),
                  )
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: (){
                pickVideo(ImageSource.camera, context);
              },
              child: Row(
                children: const[
                  Icon(Icons.camera_alt),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Camera',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Row(
                children: const[
                  Icon(Icons.cancel),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            showOptionDialog(context);
          },
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(
              color: kbuttonColor,
            ),
            child: const Center(
              child: Text(
                  'Add Video',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
