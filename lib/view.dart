import 'package:counter_app_getx/businessLogic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(
        title: Obx(() => Text("Clicks: ${c.count}")),
      ),
      // Replacing the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(
        child: ElevatedButton(
          child: const Text("Go To Other"),
          onPressed: () => Get.to(Other()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: c.increment, child: const Icon(Icons.add)),
    );
  }
}

// ignore: use_key_in_widget_constructors
class Other extends StatelessWidget {
// You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
