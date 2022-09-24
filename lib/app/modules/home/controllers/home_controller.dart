import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var likeCount = 0;
  final getStorage = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> saveLikeCount(bool isLiked) async {
    getStorage.write("isLiked", !isLiked);
    if (!isLiked) {
      likeCount++;
    } else {
      likeCount > 0 ? likeCount-- : 0;
    }
    getStorage.write("likeCount", likeCount);
    return !isLiked;
  }
}
