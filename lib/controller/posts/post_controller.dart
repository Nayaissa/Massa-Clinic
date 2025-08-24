import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/data/model/add_favorite_model.dart';
import 'package:massaclinic/data/model/comment_model.dart';
import 'package:massaclinic/data/model/post_model.dart';

abstract class PostsController extends GetxController {}

class PostsControllerImp extends PostsController {
  int currentImageIndex = 0;
  StatusRequest? postStatusRequest;
  StatusRequest? addStatusRequest;
  StatusRequest? addCommentStatusRequest;
  StatusRequest? commentStatusRequest;

  AddFavoriteModel? addFavoriteModel;
  CommentPostModel? commentModel;

  PostModel? postModel;
  @override
  void onInit() {
    showPosts();
    // showComments(id);
    super.onInit();
  }

  void changeImageIndex(int index) {
    currentImageIndex = index;
    update();
  }

  showPosts() {
    postStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/ads')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            postStatusRequest = StatusRequest.success;

            postModel = PostModel.fromJson(value.data);
            print('200 post');

            if (postModel!.data == null) {
              postStatusRequest = StatusRequest.noData;
            }
            update();
          } else {
            postStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          postStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }

  addToFavorite(String id) async {
    addStatusRequest = StatusRequest.loading;
    update();

    await DioHelper.postsData(url: '/api/toggleFavoriteAd/$id', data: {})
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            addStatusRequest = StatusRequest.success;

            addFavoriteModel = AddFavoriteModel.fromJson(value.data);
            showPosts();

            if (postModel!.data == null) {
              addStatusRequest = StatusRequest.noData;
            }
            update();
          } else {
            addStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          addStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }

}
