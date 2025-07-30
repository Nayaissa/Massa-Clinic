import 'package:get/get.dart';
import 'package:massaclinic/data/model/searchmodel.dart';

class SearcddController extends GetxController {
  List<SearchResultModel> searchResults = [];

  void search(String query) {
    List<SearchResultModel> results = [
      SearchResultModel(
        title: 'Laser Hair',
        subtitle: '500.000',
        imageUrl: 'assets/images/laserface.jpeg',
        watchedEpisodes: 2,
        totalEpisodes: 8,
        status: '9 left',
      ),
      SearchResultModel(
        title: ' Lip Botoks Face',
        subtitle: '600.000',
        imageUrl: 'assets/images/fillerface.jpeg',
        watchedEpisodes: 5,
        totalEpisodes: 5,
        status: 'ended',
      ),
    ];

    searchResults = results
        .where((item) =>
            item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    update(); 
  }
}
