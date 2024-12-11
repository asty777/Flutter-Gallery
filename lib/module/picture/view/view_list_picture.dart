import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_ids/core.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ListPictureController controller = Get.put(ListPictureController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gallery Asty',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xfff06292), 
        centerTitle: true,
      ),
      body: Obx(
            () {
          if (controller.isLoading.value) {
            return const Center(child: LoadingWidget());
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: controller.pictureList.length,
            itemBuilder: (context, index) {
              final picture = controller.pictureList[index];
              return GestureDetector(
                onTap: () {
                  controller.toDetailPage(picture);
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                        child: Stack(
                          children: [
                            Image.network(
                              picture['download_url'],
                              width: double.infinity,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xfff06292).withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const Text(
                                  'View Photo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xfffce4ec),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              picture['author'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              "Click to view details",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
