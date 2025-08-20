import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:massaclinic/controller/posts/post_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/data/model/post_model.dart';
import 'package:shimmer/shimmer.dart';

class CustomCardPost extends GetView<PostsControllerImp> {
  final Data? dataPost;

  const CustomCardPost({super.key, this.dataPost});

  static final CacheManager customCacheManager = CacheManager(
    Config(
      'noDbCache',
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 100,
      repo: JsonCacheInfoRepository(databaseName: 'inMemoryDb'),
      fileService: HttpFileService(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
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
          /// Header
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AppImageAssets.logoImage),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Massa Beauty Clinic",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColor.gery800,
                    ),
                  ),
                  Text(
                    dataPost?.createdAt ?? "3 m ago",
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 12,
                    ),
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

          /// Post text
          Text(
            dataPost?.description ?? '',
            style: const TextStyle(fontSize: 15, height: 1.4),
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

          /// Images
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
                      final imageUrl = dataPost!.images![imageIndex].replaceAll(
                        '127.0.0.1',
                        '10.0.2.2',
                      );

                      return CachedNetworkImage(
                        imageUrl: imageUrl,
                        cacheManager: customCacheManager,
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: double.infinity,
                                height: 220,
                                color: Colors.white,
                              ),
                            ),
                        errorWidget:
                            (context, url, error) =>
                                const Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),

                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "${controller.currentImageIndex + 1}/${dataPost?.images!.length}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {
                          final imageUrl = dataPost!
                              .images![controller.currentImageIndex]
                              .replaceAll('127.0.0.1', '10.0.2.2');

                          showDialog(
                            context: context,
                            builder:
                                (context) => Dialog(
                                  backgroundColor: Colors.black87,
                                  insetPadding: EdgeInsets.zero,
                                  child: GestureDetector(
                                    onTap: () => Get.back(),
                                    child: InteractiveViewer(
                                      panEnabled: true,
                                      minScale: 0.5,
                                      maxScale: 4,
                                      child: Center(
                                        child: CachedNetworkImage(
  imageUrl: imageUrl,
  cacheManager: customCacheManager,
  fit: BoxFit.contain,
  placeholder: (context, url) => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      width: double.infinity,
      height: 300,
      color: Colors.white,
    ),
  ),
  errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
)
                                      ),
                                    ),
                                  ),
                                ),
                          );
                        },
                        child: const Icon(
                          Icons.fullscreen,
                          color: Colors.white,
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
              InkWell(
                onTap: () {
                  controller.addToFavorite(dataPost!.id.toString());
                },
                child: Icon(
                  dataPost!.favoritesCount != 0
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color:
                      dataPost!.favoritesCount != 0
                          ? Colors.redAccent
                          : Colors.grey,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                dataPost!.favoritesCount.toString(),
                style: const TextStyle(color: Colors.black87),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Get.toNamed(AppRoute.commentspage),
                child: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                dataPost!.commentsCount.toString(),
                style: const TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
