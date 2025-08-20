import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/posts/post_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/view/widget/posts/customapparapp.dart';
import 'package:massaclinic/view/widget/posts/customcardpost.dart';

class SocialPosts extends StatelessWidget {
  const SocialPosts({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PostsControllerImp());

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarApp(textApp: 'Posts'),
            Expanded(
              child: GetBuilder<PostsControllerImp>(
                builder: (controller) {
                  return
                  controller.postStatusRequest == StatusRequest.loading ?
    Lottie.asset(AppImageAssets.loding,repeat: true,height: 200,width: 150): ListView.builder(

                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount:controller.postModel?.data?.length ?? 0 ,
                    itemBuilder: (context, index) {
                      return GetBuilder<PostsControllerImp>(
                        builder: (controller) {
                          return CustomCardPost(dataPost: controller.postModel!.data![index],);
                        },
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
