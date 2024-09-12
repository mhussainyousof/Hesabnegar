import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import 'books_screen.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
            top: 16,
          ),
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color.fromARGB(255, 255, 205, 4),
                  Colors.orangeAccent,
                ]),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back, color: Colors.black54)),
              const Spacer(),
               Text(
                'لیست کتاب های مفید'.tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17),
              ),
              const SizedBox(
                width: 25,
              ),
              const Spacer()
            ],
          ),
        ),
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 15, right: 12, left: 17),
            width: Get.width,
            height: Get.height * 0.9 - 6,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return Card(
                      
                        surfaceTintColor: kamberColor,
                        // color: kamberColor,
                        shape: const OutlineInputBorder(
                          borderSide: BorderSide(color: kamberColor, style: BorderStyle.none,),
                          borderRadius: BorderRadius.all(Radius.circular(20))),

                        elevation: 8,
                        margin: const EdgeInsets.all(7),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Get.to(() =>
                                      FullScreenImage(books[index].image));
                                },
                                child: CircleAvatar(
                                  radius: 77,
                                  backgroundColor:
                                      const Color.fromARGB(255, 246, 194, 38),
                                      // Colors.black,
                                  child: CircleAvatar(
                                    radius: 75,
                                    backgroundImage:
                                        AssetImage(books[index].image),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(books[index].title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text('نویسنده: ${books[index].subtite}',
                                  style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
