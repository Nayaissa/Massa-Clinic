import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/posts/comments_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/view/widget/posts/customapparapp.dart';

class CommentsPage extends StatelessWidget {
  final CommentController controller = Get.put(CommentController());
  final TextEditingController textController = TextEditingController();

  CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.backgroundColor,
    
      body: GetBuilder<CommentController>(
        builder: (controller) {
          if (controller.editingComment != null &&
              textController.text != controller.editingComment!.comment) {
            textController.text = controller.editingComment!.comment;
          }

          return Column(
            children: [
              SafeArea(child: CustomAppBarApp(textApp: 'Comments',)),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  itemCount: controller.comments.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    var comment = controller.comments[index];
                    bool isMine = comment.userId == controller.currentUserId;

                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(comment.avatar),
                                radius: 20,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  comment.username,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColor.gery800
                                  ),
                                ),
                              ),
                           
                                Text(
                                comment.time,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                               const SizedBox(height: 6),

                          Divider(height: 1,color: AppColor.grey,),
                          const SizedBox(height: 10),
                          Text(
                            comment.comment,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                            
                              const Spacer(),
                              if (isMine)
                                ElevatedButton(
                                  onPressed: () => controller.startEdit(comment),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    minimumSize: const Size(60, 30),
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: const Border(top: BorderSide(color: Colors.grey, width: 0.3)),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage("assets/images/doctor1.jpg"),
                      radius: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          hintText: "Write Comment...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        controller.editingComment != null ? Icons.check : Icons.send,
                        color:AppColor.primaryColor,
                      ),
                      onPressed: () {
                        final text = textController.text.trim();
                        if (text.isEmpty) return;

                        if (controller.editingComment != null) {
                          controller.updateComment(text);
                        } else {
                          controller.addComment(text);
                        }

                        textController.clear();
                      },
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
