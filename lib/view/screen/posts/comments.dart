import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/posts/comments_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/data/model/comment_model.dart';
import 'package:massaclinic/view/widget/reservation/customappar.dart';
import 'package:shimmer/shimmer.dart';

class CommentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommentControllerImp());
    controller.showComments("1");

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: GetBuilder<CommentControllerImp>(
          builder: (controller) {
            if (controller.commentStatusRequest == StatusRequest.loading ||
                controller.commentModel == null) {
              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: 5,
                separatorBuilder: (_, __) => SizedBox(height: 20),
                itemBuilder:
                    (_, __) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 15,
                                  width: double.infinity,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 12,
                                  width: double.infinity,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 12,
                                  width: 150,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              );
            }

            return Column(
              children: [
                CustomApparReservation(
                  icon: Icons.arrow_back_ios,
                  title: 'Comments',
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: controller.content,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "Type your comment ",
                              prefixIcon: Icon(
                                Icons.message,
                                size: 20,
                                color: Colors.grey[600],
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 2,
                                vertical: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.addComment(controller.content.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.thirdColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Publish",
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: controller.commentModel!.data!.length,
                    separatorBuilder: (_, __) => SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final comment = controller.commentModel!.data![index];
                      return CommentCard(comment: comment);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CommentCard extends GetView<CommentControllerImp> {
  final Data comment;

  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0, -8),
              child: CircleAvatar(
                backgroundImage: NetworkImage(comment.image!),
                radius: 25,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${comment.userName}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.black,
                            ),
                          ),
                        ),
                        Icon(Icons.more_vert, color: Colors.grey[700]),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      _buildTextWithMentions(comment.content ?? ""),
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(left: 290, top: 4),
          child: Text(
            (comment.createdAt ?? ""),
            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }

  TextSpan _buildTextWithMentions(String text) {
    final words = text.split(' ');
    return TextSpan(
      children:
          words.map((word) {
            final isMention = word.startsWith('@') || word.contains('@');
            return TextSpan(
              text: "$word ",
              style: TextStyle(
                color: isMention ? Colors.blue : Colors.black,
                fontWeight: isMention ? FontWeight.w600 : FontWeight.normal,
              ),
            );
          }).toList(),
    );
  }
}
