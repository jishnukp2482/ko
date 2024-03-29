import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/appcolors.dart';

void customAlertDialogue(
    {required String title,
    required String content,
    String? txtbuttonName1,
    Function? txtbutton1Action,
    String? txtbuttonName2,
    Function? txtbutton2Action}) {
  Get.dialog(AlertDialog(
    title: Text(
      title,
      style: const TextStyle(color: AppColors.black),
    ),
    content: Text(
      content,
      style: const TextStyle(color: AppColors.black),
    ),
    actions: [
      txtbutton1Action == null
          ? const SizedBox()
          : TextButton(
              onPressed: () {
                txtbutton1Action();
              },
              child: Text(txtbuttonName1!)),
      txtbutton2Action == null
          ? const SizedBox()
          : TextButton(
              onPressed: () {
                txtbutton2Action();
              },
              child: Text(txtbuttonName2!))
    ],
  ));
}
