import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: LikeButton(
          size: 80,
          likeCount: controller.getStorage.read("likeCount")??0,
          countPostion: CountPostion.bottom,
          likeBuilder: (isLiked) {
            return Icon(
              Icons.monetization_on,
              color: isLiked ? Colors.red : Colors.grey,
              size: 80,
            );
          },
          countBuilder: (likeCount, isLiked, text) {
            return Text(
              likeCount == 0 ? "" : text,
              style: TextStyle(
                  color: isLiked ? Colors.red : Colors.grey, fontSize: 20),
            );
          },
          onTap: (isLiked) {
            return controller.saveLikeCount(isLiked);
          },

          isLiked: controller.getStorage.read("isLiked")??false,
        ),
      ),
    );
  }
}
