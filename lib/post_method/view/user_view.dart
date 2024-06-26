import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_controller.dart';


class UserView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final c =  Get.put(UserController());

  UserView({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (c.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                return ElevatedButton(
                  onPressed: () {
                    c.createUser(
                      nameController.text,
                      emailController.text,
                    );
                  },
                  child: const Text('Create User'),
                );
              }
            }),
            Obx(() {
              if (c.isSuccess.value) {
                return const Text('User created successfully!');
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
