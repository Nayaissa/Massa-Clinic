import 'package:get/get.dart';
import 'package:massaclinic/data/model/Booking_model.dart';

class BookingsController extends GetxController {
  String selectedTab = 'Upcoming';

  List<BookingModel> allBookings = [
    // 🔸 Upcoming Bookings
    BookingModel(
      date: "Jul 20, 2025",
      time: "11:00 AM",
      stationName: "Glow Beauty",
      address: "123 Main St, Beauty City",
      duration: 1.0,
      imageUrl: "assets/images/laserface.jpeg",
      serviceName: "Laser Hair Removal",
      categoryName: "Body",
    ),
    BookingModel(
      date: "Jul 25, 2025",
      time: "03:30 PM",
      stationName: "Elegance Spa",
      address: "88 Soft Ave, Glam Town",
      duration: 1.5,
      imageUrl: "assets/images/fillerface.jpeg",
      serviceName: "small nose",
      categoryName: "Face",
    ),

    // 🔸 Completed Bookings
    BookingModel(
      date: "Jun 10, 2025",
      time: "01:00 PM",
      stationName: "Spark EV Hub",
      address: "456 Energy Rd, Volt Town",
      duration: 2.0,
      isCompleted: true,
      imageUrl: "assets/images/botoksface.jpeg",
      serviceName: "Botox Injection",
      categoryName: "Face",
    ),
    BookingModel(
      date: "Jun 15, 2025",
      time: "04:00 PM",
      stationName: "Luxury Touch",
      address: "999 Elite Blvd, VIP City",
      duration: 1.2,
      isCompleted: true,
      imageUrl: "assets/images/fillerface.jpeg",
      serviceName: "Lip Filler",
      categoryName: "Face",
    ),

    // 🔸 Canceled Bookings
    BookingModel(
      date: "May 28, 2025",
      time: "11:00 AM",
      stationName: "GreenCharge Station",
      address: "789 Ampere Blvd, Eco City",
      duration: 1.0,
      isCanceled: true,
      imageUrl: "assets/images/botoksface.jpeg",
      serviceName: "Quick Glow",
      categoryName: "Skin",
    ),
    BookingModel(
      date: "May 30, 2025",
      time: "12:30 PM",
      stationName: "Care Studio",
      address: "100 Fresh St, Soft Town",
      duration: 1.0,
      isCanceled: true,
      imageUrl: "assets/images/laserface.jpeg",
      serviceName: "Facial Cleanse",
      categoryName: "Face",
    ),
  ];

  void changeTab(String tab) {
    selectedTab = tab;
    update();
  }

  List<BookingModel> get filteredBookings {
    if (selectedTab == 'Upcoming') {
      return allBookings.where((b) => b.isUpcoming).toList();
    } else if (selectedTab == 'Completed') {
      return allBookings.where((b) => b.isCompleted).toList();
    } else {
      return allBookings.where((b) => b.isCanceled).toList();
    }
  }
}
