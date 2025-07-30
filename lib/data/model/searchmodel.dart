class SearchResultModel {
  final String title;
  final String subtitle;
  final String imageUrl;
  final int watchedEpisodes;
  final int totalEpisodes;
  final String status;

  SearchResultModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.watchedEpisodes,
    required this.totalEpisodes,
    required this.status,
  });
}
