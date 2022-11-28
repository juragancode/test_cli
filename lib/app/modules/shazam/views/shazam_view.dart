import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/shazam_controller.dart';
import '../../../data/models/user_model.dart';

class ShazamView extends GetView<ShazamController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShazamView'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>?>(
        future: controller.getAllUsers(),
        builder: (context, AsyncSnapshot) {
          if (AsyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (AsyncSnapshot.data?.length == 0) {
            return Center(
              child: Text("no data available"),
            );
          } else {
            return ListView.builder(
              itemCount: AsyncSnapshot.data!.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(AsyncSnapshot.data![index].avatar!),
                ),
                title: Text(
                    "${AsyncSnapshot.data![index].firstName} ${AsyncSnapshot.data![index].lastName}"),
                subtitle: Text("${AsyncSnapshot.data![index].email}"),
              ),
            );
          }
        },
      ),
    );
  }
}
