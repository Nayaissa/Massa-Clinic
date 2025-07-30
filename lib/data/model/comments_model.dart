class CommentModel {
  final int id;
  final int userId;
  final String username;
  final String avatar;
  String comment;
  final String time;

  CommentModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.avatar,
    required this.comment,
    required this.time,
  });
}
