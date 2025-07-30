class BookingModel {
  final String date;
  final String time;
  final String stationName;
  final String address;
  final bool isCompleted;
  final bool isCanceled;
  final double duration;

  final String imageUrl;     
  final String serviceName;   
  final String categoryName; 
  BookingModel({
    required this.date,
    required this.time,
    required this.stationName,
    required this.address,
    required this.duration,
    required this.imageUrl,
    required this.serviceName,
    required this.categoryName,
    this.isCompleted = false,
    this.isCanceled = false,
  });

  bool get isUpcoming => !isCompleted && !isCanceled;
}
