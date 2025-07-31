// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:massaclinic/controller/posts/comments_controller.dart';
// import 'package:massaclinic/core/constant/AppColor.dart';
// import 'package:massaclinic/view/widget/posts/customapparapp.dart';

// class CommentsPage extends StatelessWidget {
//   final CommentController controller = Get.put(CommentController());
//   final TextEditingController textController = TextEditingController();

//   CommentsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:AppColor.backgroundColor,
    
//       body: GetBuilder<CommentController>(
//         builder: (controller) {
//           if (controller.editingComment != null &&
//               textController.text != controller.editingComment!.comment) {
//             textController.text = controller.editingComment!.comment;
//           }

//           return Column(
//             children: [
//               SafeArea(child: CustomAppBarApp(textApp: 'Comments',)),
//               Expanded(
//                 child: ListView.separated(
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   itemCount: controller.comments.length,
//                   separatorBuilder: (_, __) => const SizedBox(height: 12),
//                   itemBuilder: (context, index) {
//                     var comment = controller.comments[index];
//                     bool isMine = comment.userId == controller.currentUserId;

//                     return Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             // ignore: deprecated_member_use
//                             color: Colors.black.withOpacity(0.04),
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage: AssetImage(comment.avatar),
//                                 radius: 20,
//                               ),
//                               const SizedBox(width: 10),
//                               Expanded(
//                                 child: Text(
//                                   comment.username,
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 16,
//                                     color: AppColor.gery800
//                                   ),
//                                 ),
//                               ),
                           
//                                 Text(
//                                 comment.time,
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                                const SizedBox(height: 6),

//                           Divider(height: 1,color: AppColor.grey,),
//                           const SizedBox(height: 10),
//                           Text(
//                             comment.comment,
//                             style: const TextStyle(fontSize: 15),
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             children: [
                            
//                               const Spacer(),
//                               if (isMine)
//                                 ElevatedButton(
//                                   onPressed: () => controller.startEdit(comment),
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.green,
//                                     minimumSize: const Size(60, 30),
//                                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                   child: const Text(
//                                     "Edit",
//                                     style: TextStyle(fontSize: 13),
//                                   ),
//                                 )
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: const Border(top: BorderSide(color: Colors.grey, width: 0.3)),
//                   boxShadow: [
//                     BoxShadow(
//                       // ignore: deprecated_member_use
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 6,
//                       offset: const Offset(0, -2),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: const AssetImage("assets/images/doctor1.jpg"),
//                       radius: 18,
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: TextField(
//                         controller: textController,
//                         decoration: const InputDecoration(
//                           hintText: "Write Comment...",
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         controller.editingComment != null ? Icons.check : Icons.send,
//                         color:AppColor.primaryColor,
//                       ),
//                       onPressed: () {
//                         final text = textController.text.trim();
//                         if (text.isEmpty) return;

//                         if (controller.editingComment != null) {
//                           controller.updateComment(text);
//                         } else {
//                           controller.addComment(text);
//                         }

//                         textController.clear();
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';



class CommentsPage extends StatelessWidget {
  final List<Comment> comments = [
    Comment(
      name: "Rihanna Josephine",
      timeAgo: "2 hours ago",
      text: "The document looks valid to me @RajeshPandey",
      label: "Customer KYC",
      avatarUrl: "assets/images/doctor1.jpg",
    ),
    Comment(
      name: "Sophey Paul",
      timeAgo: "23 hours ago",
      text: "Validation would be needed from GHUP Board of Directors by Friday!",
      label: "Customer KYC",
      avatarUrl: "assets/images/doctor3.jpeg",
    ),
    Comment(
      name: "John Selese",
      timeAgo: "23 hours ago",
      text: "Hey @Sophey Paul, what are the further steps to be taken?",
      avatarUrl: "assets/images/doctor1.jpg",
    ),
    Comment(
      name: "John Selese",
      timeAgo: "23 hours ago",
      text: "Hey @Sophey Paul, please take a look.",
      avatarUrl: "assets/images/doctor2.jpeg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(title: Text('Comments'), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    
                    decoration: InputDecoration(
                
                        fillColor: Colors.grey[200],
                filled: true,
                      hintText: "Type your comment here",
                      prefixIcon: Icon(Icons.message, size: 20),
                      border: OutlineInputBorder(
                        
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: AppColor.backgroundColor,
                    backgroundColor: AppColor.thirdColor,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  child: Text("Publish",style: TextStyle(color: AppColor.primaryColor),),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: comments.length,
              separatorBuilder: (_, __) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                final comment = comments[index];
                return CommentCard(comment: comment);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Comment {
  final String name;
  final String timeAgo;
  final String text;
  final String? label;
  final String avatarUrl;

  Comment({
    required this.name,
    required this.timeAgo,
    required this.text,
    this.label,
    required this.avatarUrl,
  });
}

class CommentCard extends StatelessWidget {
  final Comment comment;

  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(comment.avatarUrl), radius: 22),
              SizedBox(width: 10),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${comment.name} ",
                        style: TextStyle(fontWeight: FontWeight.w600,color: AppColor.black),
                      ),
                      TextSpan(
                        text: "\n added a comment ${comment.timeAgo}",
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              Icon(Icons.more_vert, color: Colors.grey[700]),
            ],
          ),
          SizedBox(height: 10),
          Text.rich(
            _buildTextWithMentions(comment.text),
            style: TextStyle(fontSize: 15),
          ),
          // if (comment.label != null) ...[
          //   SizedBox(height: 10),
          //   Container(
          //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          //     decoration: BoxDecoration(
          //       color: Color(0xFFFAE5E5),
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Icon(Icons.picture_as_pdf, color: Colors.red, size: 18),
          //         SizedBox(width: 6),
          //         Text(comment.label!, style: TextStyle(fontWeight: FontWeight.w500)),
          //       ],
          //     ),
          //   ),
          // ],
        ],
      ),
    );
  }

  TextSpan _buildTextWithMentions(String text) {
    final words = text.split(' ');
    return TextSpan(
      children: words.map((word) {
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