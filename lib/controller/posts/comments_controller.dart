import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/data/model/comment_model.dart';

abstract class CommentController extends GetxController {}

class CommentControllerImp extends GetxController {
  int currentUserId = 1;

  StatusRequest? addCommentStatusRequest;
  StatusRequest? commentStatusRequest;

  CommentPostModel? commentModel;
  late String itemId;
  late TextEditingController content;

  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments;
    itemId = data['id'].toString();
    content = TextEditingController();
    showComments(itemId.toString());
  }

  @override
  void onClose() {
    content.dispose();

    super.onClose();
  }

  showComments(String id) async {
    commentStatusRequest = StatusRequest.loading;
    update();

    await DioHelper.getDataa(url: '/api/ShowComments/$id')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            commentStatusRequest = StatusRequest.success;
            commentModel = CommentPostModel.fromJson(value.data);

            update();
          } else {
            commentStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          commentStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }
addComment(String contentText) async {
  addCommentStatusRequest = StatusRequest.loading;
  update();

  try {
    var response = await DioHelper.postsData(
      url: '/api/addComment/$itemId',
      data: {},
      query: {'content': contentText},
    );

    if (response!.statusCode == 200) {
      addCommentStatusRequest = StatusRequest.success;
      await showComments(itemId); 
    } else {
      addCommentStatusRequest = StatusRequest.noData;
    }
  } catch (error) {
    print(error.toString());
    addCommentStatusRequest = StatusRequest.serverfailure;
  }

  update();
}


  // List<CommentModel> comments = [
  //   CommentModel(
  //     id: 1,
  //     userId: 1,
  //     username: "Holo D. Wisewolf",
  //     avatar: "assets/images/doctor1.jpg",
  //     comment: "This really helped me! ",
  //     time: "2m ago",
  //   ),
  //   CommentModel(
  //     id: 2,
  //     userId: 2,
  //     username: "Aya H.",
  //     avatar: "assets/images/doctor2.jpeg",
  //     comment: "I'm glad it worked for you!",
  //     time: "1m ago",
  //   ),
  // ];

  // CommentModel? editingComment;

  // void addComment(String text) {
  //   comments.add(
  //     CommentModel(
  //       id: DateTime.now().millisecondsSinceEpoch,
  //       userId: currentUserId,
  //       username: "Holo D. Wisewolf",
  //       avatar: "assets/doctor.png",
  //       comment: text,
  //       time: "Just now",
  //     ),
  //   );
  //   update();
  // }

  // void startEdit(CommentModel comment) {
  //   editingComment = comment;
  //   update();
  // }

  // void updateComment(String newText) {
  //   if (editingComment != null) {
  //     editingComment!.comment = newText;
  //     editingComment = null;
  //     update();
  //   }
  // }

  // void deleteComment(int id) {
  //   comments.removeWhere((c) => c.id == id && c.userId == currentUserId);
  //   update();
  // }

  // void cancelEdit() {
  //   editingComment = null;
  //   update();
  // }
}
