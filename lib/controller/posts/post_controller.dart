import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/data/model/post_model.dart';

abstract class PostsController extends GetxController {}

class PostsControllerImp extends PostsController {
  int currentImageIndex = 0;
  StatusRequest? postStatusRequest;
  PostModel? postModel;
  @override
  void onInit() {
    showPosts();
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
}
