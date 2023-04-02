import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/constants.dart';
import 'package:tiktokclone/controllers/video_controller.dart';
import 'package:tiktokclone/views/widgets/video_player_item.dart';
import 'package:video_player/video_player.dart';

import '../widgets/circle_animation.dart';


class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);

  final VideoController videoController = Get.put(VideoController());

  buildMusicAlbum(String profilephoto){
    return SizedBox(
      width: 50,
      height: 60,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(11),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.white
                ]
              ),
              borderRadius: BorderRadius.circular(25),

            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(profilephoto,fit: BoxFit.cover,),
            ),
          )
      ],
    ),
    );
  }

  buildProfile(String profilephoto){
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            child: Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(profilephoto,fit: BoxFit.cover,),
              )
            ),
          )
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx((){
        return PageView.builder(
          controller: PageController(initialPage: 0,viewportFraction: 1),
          itemCount: videoController.videoList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
            final data = videoController.videoList[index];
            return Stack(
              children: [
                VideoPlayerItem(videoUrl: data.videoUrl!),
                Column(
                  children: [
                    const SizedBox(height: 100,),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '${data.username}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                  Text(
                                    '${data.caption}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.music_note,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '${data.songname}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(top: size.height/5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildProfile('${data.profilephoto}'),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        videoController.likeVideo(data.id!);
                                      },
                                      child: Icon(
                                        Icons.favorite,
                                        color: data.likes!.contains(authController.user.uid)?Colors.red:Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                    SizedBox(height: 7,),
                                    Text(
                                        '${data.likes!.length}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20
                                        )
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: (){

                                      },
                                      child: Icon(
                                        Icons.comment,
                                        size: 40,
                                      ),
                                    ),
                                    SizedBox(height: 7,),
                                    Text(
                                        '${data.commentCount}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20
                                        )
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: (){

                                      },
                                      child: Icon(
                                        Icons.reply,
                                        size: 40,
                                      ),
                                    ),
                                    SizedBox(height: 7,),
                                    Text(
                                        '${data.shareCount}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20
                                        )
                                    )
                                  ],
                                ),
                                CircleAnimation(
                                    child:buildMusicAlbum('${data.profilephoto}')
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                    )

                  ],

                )
              ],
            );
          },
        );
      }
      ),
    );
  }
}
