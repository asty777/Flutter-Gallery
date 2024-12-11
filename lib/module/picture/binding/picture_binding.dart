import 'package:get/get.dart';
import 'package:flutter_ids/core.dart';

class PictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPictureController>(() => ListPictureController());
  }
}