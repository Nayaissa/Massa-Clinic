import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/search_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SearcddController controller = Get.put(SearcddController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(title: const Text('Title')),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (value) => controller.search(value),
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            Expanded(
              child: GetBuilder<SearcddController>(
                builder: (controller) {
                  if (controller.searchResults.isEmpty) {
                    return const Center(child: Text("No results"));
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    itemCount: controller.searchResults.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = controller.searchResults[index];
                      // final progress =
                      //     item.watchedEpisodes / item.totalEpisodes;

                      return Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 250, 235, 244),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1,color: AppColor.thirdColor)
                        ),

                        // margin: EdgeInsets.o(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item.imageUrl,
                                width: 90,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.gery800,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 4, width: 4),
                                        Text(
                                          'Price :',
                                          style: const TextStyle(
                                            color: AppColor.gery800,
                                          ),
                                        ),

                                        Spacer(),
                                        Text(
                                          item.subtitle,
                                          style: const TextStyle(
                                            color: Colors.greenAccent,
                                          ),
                                        ),
                                        
                                      ],
                                      
                                    ),
                                    
                                  ),
                                  //  Row(
                                  //   children: [
                                  //     IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
                                  //   ],
                                  // ),
                                  // const SizedBox(height: 8),
                                  // LinearProgressIndicator(
                                  //   value: progress,
                                  //   backgroundColor: Colors.grey.shade300,
                                  //   color: Colors.yellow[700],
                                  //   minHeight: 5,
                                  //   borderRadius: BorderRadius.circular(10),
                                  // ),
                                  Row(
                                    children: [
                                      Spacer(),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {}, icon: Icon(Icons.favorite,color:Colors.redAccent,size: 20,)),
                                    ],
                                  ),
                                 
                                  // Row(
                                  //   children: [

                                  //     const SizedBox(width: 8),
                                  //     Text(
                                  //       item.status,
                                  //       style: TextStyle(
                                  //         color: item.status == "ended"
                                  //             ? Colors.grey
                                  //             : Colors.black,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
