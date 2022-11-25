import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductsController extends GetxController {
  RxList<Map<String, dynamic>> allProduct = <Map<String, dynamic>>[
    {
      "id": 1,
      "name": "ADIDAS ULTRABOOST 22 Men's Running Shoes - Black",
      "price": 3300000,
    },
    {
      "id": 2,
      "name": "NEW BALANCE 410v7 Men's Running Shoes - Black With Grey",
      "price": 719200,
    },
    {
      "id": 3,
      "name": "Nike Zoom Fly 5 Men's Road Running Shoes - Green",
      "price": 2489000,
    },
  ].obs;

  NumberFormat f = NumberFormat.decimalPattern("en_US");

  void addProduct(String name, String price) {
    if (name.isNotEmpty && price.isNotEmpty) {
      allProduct.add({
        "id": DateTime.now().toIso8601String(),
        "name": name,
        "price": f.format(int.parse(price)),
      });
      Get.back();
    }
  }
}
