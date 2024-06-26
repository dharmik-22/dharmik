import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/post_controller.dart';

class PostView extends StatelessWidget {
  final PostController postController = Get.put(PostController());

   PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: postController.postList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(postController.postList[index].title),
                subtitle: Text(postController.postList[index].body),
              );
            },
          );
        }
      }),
    );
  }
}
