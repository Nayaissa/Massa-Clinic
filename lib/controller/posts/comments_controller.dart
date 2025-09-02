// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:massaclinic/core/class/diohelper.dart';
// import 'package:massaclinic/core/class/statusrequest.dart';
// import 'package:massaclinic/data/model/comment_model.dart';

// abstract class CommentController extends GetxController {}

// class CommentControllerImp extends GetxController {
//   int currentUserId = 1;

//   StatusRequest? addCommentStatusRequest;
//   StatusRequest? commentStatusRequest;
//   StatusRequest? editStatusRequest;

//   CommentPostModel? commentModel;
//   late String itemId;
//   late TextEditingController content;

//   @override
//   void onInit() {
//     super.onInit();
//     var data = Get.arguments;
//     itemId = data['id'].toString();
//     content = TextEditingController();
//     showComments(itemId.toString());
//   }

//   @override
//   void onClose() {
//     content.dispose();

//     super.onClose();
//   }

//   showComments(String id) {
//     commentStatusRequest = StatusRequest.loading;
//     update();

//     DioHelper.getDataa(url: '/api/ShowComments/$id')
//         .then((value) {
//           print(value!.data);
//           if (value.statusCode == 200) {
//             commentStatusRequest = StatusRequest.success;
//             commentModel = CommentPostModel.fromJson(value.data);
//             update();
//           } else {
//             commentStatusRequest = StatusRequest.noData;
//           }
//           update();
//         })
//         .catchError((error) {
//           print(error.toString());
//           commentStatusRequest = StatusRequest.serverfailure;
//           update();
//         });
//   }

//   addComment(String contentText) {
//     addCommentStatusRequest = StatusRequest.loading;
//     update();
//     DioHelper.postsData(
//           url: '/api/addComment/$itemId',
//           data: {},
//           query: {'content': contentText},
//         )
//         .then((value) {
//           print(value!.data);
//           if (value.statusCode == 201) {
//             addCommentStatusRequest = StatusRequest.success;
//             content.clear();
//             showComments(itemId);
//             update();
//             print('200 post');
//             update();
//           } else {
//             addCommentStatusRequest = StatusRequest.noData;
//           }
//           update();
//         })
//         .catchError((error) {
//           print(error.toString());
//           addCommentStatusRequest = StatusRequest.serverfailure;
//           update();
//         });
//     //
//   }

//   editComment(String id, String contentText) async {
//     editStatusRequest = StatusRequest.loading;
//     update();

//     try {
//       var response = await DioHelper.putData(
//         url: '/api/updateComment/$id',
//         data: {},
//         query: {'content': contentText},
//       );

//       if (response!.statusCode == 200) {
//         editStatusRequest = StatusRequest.success;

//         update();
//       } else {
//         editStatusRequest = StatusRequest.noData;
//       }
//     } catch (error) {
//       print(error.toString());
//       editStatusRequest = StatusRequest.serverfailure;
//     }

//     update();
//   }
// }
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
  StatusRequest? editStatusRequest;
  StatusRequest? deleteStatusRequest;

  CommentPostModel? commentModel;
  late String itemId;
  late TextEditingController content;

  /// لتحديد هل نحن نعدل تعليق معين
  String? editingCommentId;

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

  showComments(String id) {
    commentStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/ShowComments/$id').then((value) {
      if (value != null && value.statusCode == 200) {
        commentStatusRequest = StatusRequest.success;
        commentModel = CommentPostModel.fromJson(value.data);
      } else {
        commentStatusRequest = StatusRequest.noData;
      }
      update();
    }).catchError((error) {
      commentStatusRequest = StatusRequest.serverfailure;
      update();
    });
  }

  addOrEditComment(String contentText) {
    if (editingCommentId != null) {
      editComment(editingCommentId!, contentText);
      return;
    }

    addCommentStatusRequest = StatusRequest.loading;
    update();
    DioHelper.postsData(
      url: '/api/addComment/$itemId',
      data: {},
      query: {'content': contentText},
    ).then((value) {
      if (value != null && value.statusCode == 201) {
        addCommentStatusRequest = StatusRequest.success;
        content.clear();
        showComments(itemId);
      } else {
        addCommentStatusRequest = StatusRequest.noData;
      }
      update();
    }).catchError((error) {
      addCommentStatusRequest = StatusRequest.serverfailure;
      update();
    });
  }

  editComment(String id, String contentText) async {
    editStatusRequest = StatusRequest.loading;
    update();

    try {
      var response = await DioHelper.putData(
        url: '/api/updateComment/$id',
        data: {},
        query: {'content': contentText},
      );

      if (response != null && response.statusCode == 200) {
        editStatusRequest = StatusRequest.success;
        editingCommentId = null;
        content.clear();
        showComments(itemId);
      } else {
        editStatusRequest = StatusRequest.noData;
      }
    } catch (error) {
      editStatusRequest = StatusRequest.serverfailure;
    }

    update();
  }

  deleteComment(String id) async {
    deleteStatusRequest = StatusRequest.loading;
    update();

    try {
      var response = await DioHelper.deleteData(url: '/api/deleteComment/$id',data: {});
      if (response != null && response.statusCode == 200) {
        deleteStatusRequest = StatusRequest.success;
        showComments(itemId);
      } else {
        deleteStatusRequest = StatusRequest.noData;
      }
    } catch (e) {
      deleteStatusRequest = StatusRequest.serverfailure;
    }
    update();
  }
}
