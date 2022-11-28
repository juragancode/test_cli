import 'package:get/get.dart';

import '../controllers/shazam_controller.dart';

class ShazamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShazamController>(
      () => ShazamController(),
    );
  }
}
