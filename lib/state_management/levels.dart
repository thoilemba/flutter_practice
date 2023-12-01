import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Level1 extends StatelessWidget {
  const Level1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Level2();
  }
}

class Level2 extends StatelessWidget {
  const Level2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    MyController newData = Get.find();
    return Obx(() => Text('Data in Level 3 : ${newData.text}'));
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    MyController newData = Get.find();
    return Obx(() => Text('${newData.text}'));
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      init: MyController(),
      builder: (controller) => TextField(
        controller: controller.textController,
        onChanged: (text) {
          controller.updateText(text);
        },
      ),
    );
  }
}

class MyController extends GetxController {
  TextEditingController textController = TextEditingController();
  RxString text = 'First Text'.obs;

  updateText(String newText) {
    text.value = newText;
  }
}