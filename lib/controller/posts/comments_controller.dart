import 'package:get/get.dart';
import 'package:massaclinic/data/model/comments_model.dart';

class CommentController extends GetxController {
  int currentUserId = 1;

  List<CommentModel> comments = [
    CommentModel(
      id: 1,
      userId: 1,
      username: "Holo D. Wisewolf",
      avatar: "assets/images/doctor1.jpg",
      comment: "This really helped me! ",
      time: "2m ago",
    ),
    CommentModel(
      id: 2,
      userId: 2,
      username: "Aya H.",
      avatar: "assets/images/doctor2.jpeg",
      comment: "I'm glad it worked for you!",
      time: "1m ago",
    ),
  ];

  CommentModel? editingComment;

  void addComment(String text) {
    comments.add(
      CommentModel(
        id: DateTime.now().millisecondsSinceEpoch,
        userId: currentUserId,
        username: "Holo D. Wisewolf",
        avatar: "assets/doctor.png",
        comment: text,
        time: "Just now",
      ),
    );
    update();
  }

  void startEdit(CommentModel comment) {
    editingComment = comment;
    update();
  }

  void updateComment(String newText) {
    if (editingComment != null) {
      editingComment!.comment = newText;
      editingComment = null;
      update();
    }
  }

  void deleteComment(int id) {
    comments.removeWhere((c) => c.id == id && c.userId == currentUserId);
    update();
  }

  void cancelEdit() {
    editingComment = null;
    update();
  }
}
