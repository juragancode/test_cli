import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';
import '../../products/controllers/products_controller.dart';

class AddProductView extends GetView<AddProductController> {
  final productC = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddProductView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.nameC,
            decoration: InputDecoration(
              labelText: "name",
            ),
          ),
          // SizedBox(height: 10),
          TextField(
            controller: controller.priceC,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "price",
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => productC.addProduct(
              controller.nameC.text,
              controller.priceC.text,
            ),
            child: Text(
              "add product",
            ),
          ),
        ],
      ),
    );
  }
}
