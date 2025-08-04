import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/posts/post_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/data/model/post_model.dart';

List<String> postImages = [
  'assets/images/fillerface.jpeg',
  'assets/images/laserface.jpeg',
  'assets/images/botoksface.jpeg',
];

// ignore: must_be_immutable
class CustomCardPost extends GetView<PostsControllerImp> {
   CustomCardPost({super.key, this.dataPost});
  Data? dataPost;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AppImageAssets.logoImage),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    "Massa Beauty Clinic",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColor.gery800,
                    ),
                  ),
                  Text(
                    dataPost?.createdAt?? " 3 m ago" ,
                    style: TextStyle(color: Colors.blueAccent, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.verified, color: Colors.blueAccent, size: 20),
              const SizedBox(width: 4),
              const Icon(Icons.more_vert, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 16),
           Text(
           dataPost?.description?? '',
            style: TextStyle(fontSize: 15, height: 1.4),
          ),
          const SizedBox(height: 8),
          const Text(
            "#goodbyeheadache  #nightingalerocks",
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 220,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: dataPost?.images?.length ?? 0,
                    onPageChanged: (i) => controller.changeImageIndex(i),
                    itemBuilder: (context, imageIndex) {
                      print( dataPost!.images![imageIndex]);
                      return Image.network(
                        dataPost!.images![imageIndex].replaceAll('127.0.0.1', '10.0.2.2'),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),

                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "${controller.currentImageIndex + 1}/${dataPost?.images!.length}",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                 Positioned(
                
  top: 8,
  right: 8,
  child: Container(
    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(8),),
    child: InkWell(
      onTap: () {
         final imageUrl = dataPost!.images![controller.currentImageIndex]
              .replaceAll('127.0.0.1', '10.0.2.2'); // فقط لصورة الشبكة
      
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.black87,
              insetPadding: EdgeInsets.all(0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(), // إغلاق عند النقر
                child: InteractiveViewer(
                  panEnabled: true,
                  minScale: 0.5,
                  maxScale: 4,
                  child: Center(
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      
      child: Icon(
        Icons.fullscreen, color: Colors.white
       
       
      
      ),
    ),
  ),
),

                  const Positioned(
                    bottom: 8,
                    right: 8,
                    child: Icon(Icons.mouse, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          Row(
            children: [
              InkWell(child: Icon(dataPost!.favoritesCount != 0? Icons.favorite : Icons.favorite_border_outlined, color:dataPost!.favoritesCount != 0? Colors.redAccent:Colors.grey )),
              SizedBox(width: 4),
              Text(dataPost!.favoritesCount.toString(), style: TextStyle(color: Colors.black87)),
              Spacer(),
              InkWell(
                onTap: () => Get.toNamed(AppRoute.commentspage),
                child: Icon(Icons.chat_bubble_outline, color: Colors.grey),
              ),
              SizedBox(width: 4),
              Text(dataPost!.commentsCount.toString(), style: TextStyle(color: Colors.black87)),
            ],
          ),
        ],
      ),
    );
  }
}
