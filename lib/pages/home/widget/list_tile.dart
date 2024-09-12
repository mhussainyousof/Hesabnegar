import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/pages/home/controller/list_controller.dart';

import '../../../controllers/hive_controller.dart';
import '../../../controllers/manage_errors/dialog.dart';
import '../../add_edit_transaction/controller/radio_controller.dart';
import '../../../controllers/textfield_controller.dart';
import '../../add_edit_transaction/transaction_screen.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(

          itemCount: Get.find<ListController>().moneys.length,
          itemBuilder: (context, index) {
            var task = Get.find<ListController>().moneys[index];
            return GestureDetector(
              
              onTap: () {
                Get.find<HiveController>().getData();
                Get.to(() => TransactionScreen());
                Get.find<TextFieldController>().description!.text = task.title!;
                Get.find<TextFieldController>().pprice!.text = task.price!;
                Get.find<ListController>().isEditing = true;
                Get.find<ListController>().index = index;
                Get.find<RadioController>()
                    .setSelectedValue(task.isReceived! ? 0 : 1);
                Get.find<ListController>().selectItemForEditing(context, index);
              },
              onLongPress: () {
                Get.dialog(
                    ShowDialogTwoButtonWidget(
                        text1: 'آیا از حذف این آیتم مطمئن هستید :( ؟'.tr,
                        text2: '',
                        textbuttonRight: 'خیر'.tr,
                        textbuttonLeft: 'بله'.tr,
                        onpressedRight: () {
                          Get.back();
                        },
                        onpressedLeft: () {
                          Get.find<HiveController>().hiveBox.deleteAt(index);
                          Get.find<HiveController>().getData();
                          Get.back();
                        },
                        child: 'بله'.tr),
                    transitionDuration: const Duration(seconds: 0));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15,left: 6, right: 6),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: task.isReceived! ? Colors.green : Colors.red,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Icon(
                              task.isReceived! ? Icons.add : Icons.remove,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          task.title ?? "",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                               
                                Text(
                                  Get.find<ListController>().moneys[index].price ??
                                      "",
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            Text(
                              task.date!,
                              
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
                
              ),
            );
          });
          
    });
  }
}