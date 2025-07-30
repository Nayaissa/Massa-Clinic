// // import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:massaclinic/controller/services_controller.dart';
// import 'package:massaclinic/core/constant/AppColor.dart';
// import 'package:massaclinic/data/model/unified_service_model.dart';

// // ignore: must_be_immutable
// class CustomCardService extends GetView<ServicreControllerImp> {
//   CustomCardService({
//     super.key,
//     this.services,
//     this.onTap,
//     this.imageUrl,
//     this.price,
//     this.name,
//     this.isFav,
//     this.desc,
//     this.id
//   });
//   void Function()? onTap;
//   UnifiedServiceModel? services;
//   String? imageUrl;
//   String? name;
//   String? price;
//   int? isFav;
//     String? desc;
//   String? id;



//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 250, 235, 244),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(width: 1, color: AppColor.thirdColor),
//         boxShadow: const [BoxShadow(color: AppColor.thirdColor, blurRadius: 1)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             child: Image.network(
//               services == null ? imageUrl! : services!.image,
//               height: 118,
//               fit: BoxFit.cover,
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: Text(
//               services == null ? name! : services!.name,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 color: AppColor.grey,
//               ),
//             ),
//           ),
//           SizedBox(height: 2),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: Row(
//               children: [
//                 Text('Price :', style: TextStyle(color: AppColor.gery800)),
//                 Spacer(),
//                 Text(
//                   services == null ? name! : services!.name + '\$',
//                   style: TextStyle(color: Colors.green),
//                 ),
//               ],
//             ),
//           ),
//           // const Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: Row(
//               children: [
//                 Spacer(),
//                 InkWell(
//                   onTap: onTap,
//                   child: Icon(
//                     services?.is_Favorite != 0 || isFav !=0
//                         ? Icons.favorite
//                         : Icons.favorite_border_outlined,
//                     color:
//                         services?.is_Favorite!= 0 || isFav != 0 ? Colors.red : Colors.grey,
//                     size: 19,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: ElevatedButton(
//               onPressed: () {
//                 controller.goToDetailsSer(
//                   services?.name ?? name!,
//                   services?.image ?? imageUrl!,
//                   services?.description ??desc! ,
//                   services?.price.toString() ??price!,
//                   services?.id.toString()?? id!,
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size.fromHeight(30),
//                 backgroundColor: AppColor.primaryColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: const Text(
//                 'registe now',
//                 style: TextStyle(color: AppColor.thirdColor),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:massaclinic/controller/search_controller.dart';
// import 'package:massaclinic/controller/services_controller.dart';
// import 'package:massaclinic/core/class/statusrequest.dart';
// import 'package:massaclinic/core/constant/AppColor.dart';
// import 'package:massaclinic/core/constant/AppImagesAssets.dart';
// import 'package:massaclinic/view/widget/Favorite&search/customsearch.dart';
// import 'package:massaclinic/view/widget/services/customapparservices.dart';
// import 'package:massaclinic/view/widget/services/customcardservice.dart';
// import 'package:massaclinic/view/widget/services/listclassfication.dart';

// class ServicesPage extends StatelessWidget {
//   const ServicesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(ServicreControllerImp());
//     SearcddController controllerser = Get.put(SearcddController());

//     return Scaffold(
//       body: SafeArea(
//         child: GetBuilder<ServicreControllerImp>(
//           builder: (controller) {
//             return Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Column(
//                 children: [
//                   CustomApparServices(
//                     onChanged: (val) {
//                       controller.onSearchItems(val);
//                       controller.checkSearch(val);
//                     },
//                     search: controller.mysearch,
//                     onPressedsearch: () {
//                       //controller.onSearchItems();
//                     },
//                     title: 'search here',
//                     prefixIcon: Icons.search_outlined,
//                     onPressed: () {},
//                   ),
//                   const SizedBox(height: 5),

//                   controller.classStatusRequest == StatusRequest.loading
//                       ? Center(
//                         child: Lottie.asset(
//                           AppImageAssets.loding,
//                           width: 200,
//                           height: 150,
//                         ),
//                       )
//                       : controller.classficationModel?.data != null
//                       ? !controller.isSearch
//                           ? Container(
//                             height: 48,
//                             margin: const EdgeInsets.symmetric(vertical: 8),
//                             child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount:
//                                   controller.classficationModel!.data!.length,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 12,
//                               ),
//                               itemBuilder: (context, index) {
//                                 final isSelected =
//                                     index == controller.selectedCategoryIndex;
//                                 final title =
//                                     controller
//                                         .classficationModel!
//                                         .data![index]
//                                         .title ??
//                                     'غير معروف';

//                                 return ListClassfication(
//                                   onTap: () {
//                                     controller.selectCategory(index);
//                                   },
//                                   color:
//                                       isSelected
//                                           ? AppColor.thirdColor
//                                           : Colors.white,
//                                   colortext:
//                                       isSelected
//                                           ? AppColor.primaryColor
//                                           : AppColor.grey,
//                                   nameCat: title,
//                                 );
//                               },
//                             ),
//                           )
//                           : SizedBox(height: 5)
//                       : Text(''),

//                   !controller.isSearch
//                       ? Expanded(
//                         child:
//                             controller.servicesStatusRequest ==
//                                     StatusRequest.loading
//                                 ? Center(
//                                   child: Lottie.asset(
//                                     AppImageAssets.loding,
//                                     width: 200,
//                                     height: 150,
//                                   ),
//                                 )
//                                 : controller.servicesStatusRequest ==
//                                     StatusRequest.noData
//                                 ? Center(
//                                   child: Lottie.asset(
//                                     AppImageAssets.noData,
//                                     width: 200,
//                                     height: 150,
//                                   ),
//                                 )
//                                 : GridView.builder(
//                                   padding: const EdgeInsets.all(14),
//                                   itemCount:
//                                       controller.displayedServices?.length ?? 0,
//                                   gridDelegate:
//                                       const SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 2,
//                                         mainAxisSpacing: 16,
//                                         crossAxisSpacing: 16,
//                                         childAspectRatio: 0.68,
//                                       ),
//                                   itemBuilder: (context, index) {
//                                     return GetBuilder<ServicreControllerImp>(
//                                       id: 'favorite_$index',
//                                       builder: (controller) {
//                                         final service =
//                                             controller
//                                                 .displayedServices![index];
//                                         return CustomCardService(
//                                           services: service,
//                                           onTap: () {
//                                             controller.addToFavorite(
//                                               service.id.toString(),
//                                               index,
//                                             );
//                                           },
//                                         );
//                                       },
//                                     );
//                                   },
//                                 ),
//                       )
//                       : ListSearch(),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class ListSearch extends GetView<ServicreControllerImp> {
//   const ListSearch({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GetBuilder<ServicreControllerImp>(
//         builder: (controller) {
//           return controller.SearchStatusRequest == StatusRequest.noData
//               ? Lottie.asset(AppImageAssets.noData, width: 250)
//               : GridView.builder(
//                                   padding: const EdgeInsets.all(14),
//                                   itemCount: controller.searchModel?.services?.length ?? 0,
//                  gridDelegate:
//                                       const SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 2,
//                                         mainAxisSpacing: 16,
//                                         crossAxisSpacing: 16,
//                                         childAspectRatio: 0.68,
//                                       ),
//                 itemBuilder: (context, index) {
//                   final item = controller.searchModel?.services?[index];
//                   // final progress =
//                   //     item.watchedEpisodes / item.totalEpisodes;

//                   return CustomCardService(
//                     imageUrl: item?.image ?? '',
//                     name: item?.name ?? '',
//                     price: item?.price ?? '',
//                     isFav: item?.isFavorite ?? 0,
//                     id: item?.id.toString(),
//                     desc: item?.description ?? '',
//                     onTap: () {
//                       controller.addToFavorite(item!.id.toString(), index);
//                     },
//                   );
//                 },
//               );
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:massaclinic/core/constant/AppColor.dart';
// import 'package:massaclinic/view/widget/reservation/customappar.dart';

// class ComplaintPage extends StatelessWidget {
//   const ComplaintPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.backgroundColor,
     
//       body: SafeArea(
//         child: Column(
//           children: [
//             // _buildHeaderSection(),
//             CustomApparReservation(icon: Icons.arrow_back_ios_new_outlined, title: 'Complaints'),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 16),
//                     _buildNewComplaintButton(),
//                     const SizedBox(height: 16),
//                     // _buildStatsGrid(),
//                     const SizedBox(height: 24),
//                     _buildRecentComplaintsHeader(),
//                     const SizedBox(height: 12),
//                     _buildComplaintCard("AC Repairing Services", "Resolved", Colors.green),
//                     _buildComplaintCard("AC Repairing Services", "Notreslove", Colors.orange),
//                     _buildComplaintCard("AC Repairing Services", "Resolved", Colors.green),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeaderSection() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: const BoxDecoration(
//         color: AppColor.thirdColor,
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//       ),
//       child: Row(
//         children: [
//           const CircleAvatar(
//             radius: 24,
//             backgroundImage: AssetImage('assets/images/doctor1.jpg')
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   "Salah Uddin",
//                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(height: 2),
//                 Text(
//                   "01670118939",
//                   style: TextStyle(color: Colors.white70, fontSize: 13),
//                 ),
//               ],
//             ),
//           ),
//           const Icon(Icons.notifications_none, color: Colors.white),
//           const SizedBox(width: 12),
//           const Icon(Icons.settings, color: Colors.white),
//         ],
//       ),
//     );
//   }

//   Widget _buildNewComplaintButton() {
//     return SizedBox(
//       width: double.infinity,
//       height: 50,
//       child: ElevatedButton.icon(
//         onPressed: () {},
//         icon: const Icon(Icons.add),
//         label: const Text('New Complaint',style: TextStyle(color: AppColor.primaryColor),),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColor.thirdColor,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           textStyle: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }

//   // Widget _buildStatsGrid() {
//   //   final stats = [
//   //     {"title": "Total", "value": "114"},
//   //     {"title": "Open", "value": "99"},
//   //     {"title": "Closed", "value": "13"},
//   //     {"title": "Reopen", "value": "2"},
//   //     {"title": "Users", "value": "33"},
//   //     {"title": "Area", "value": "6"},
//   //   ];

//   //   return Container(
//   //     padding: const EdgeInsets.all(12),
//   //     decoration: BoxDecoration(
//   //       color: Colors.white,
//   //       borderRadius: BorderRadius.circular(12),
//   //     ),
//   //     child: GridView.builder(
//   //       shrinkWrap: true,
//   //       itemCount: stats.length,
//   //       physics: const NeverScrollableScrollPhysics(),
//   //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//   //         crossAxisCount: 3,
//   //         mainAxisExtent: 65,
//   //         crossAxisSpacing: 10,
//   //         mainAxisSpacing: 10,
//   //       ),
//   //       itemBuilder: (_, index) {
//   //         return Column(
//   //           children: [
//   //             Text(
//   //               stats[index]["value"]!,
//   //               style: const TextStyle(
//   //                 fontSize: 18,
//   //                 fontWeight: FontWeight.bold,
//   //                 color: Color(0xFF0060C8),
//   //               ),
//   //             ),
//   //             const SizedBox(height: 4),
//   //             Text(
//   //               stats[index]["title"]!,
//   //               style: const TextStyle(color: Colors.grey, fontSize: 13),
//   //             ),
//   //           ],
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }

//   Widget _buildRecentComplaintsHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: const [
//         Text("Recent Complaints", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColor.gery800)),
//         Text("View All", style: TextStyle(color:AppColor.primaryColor, fontWeight: FontWeight.w500)),
//       ],
//     );
//   }

//   Widget _buildComplaintCard(String title, String status, Color color) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border:Border.all(color: AppColor.secondaryColor) ,
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // const Text("ID: #10403229612", style: TextStyle(fontSize: 12, color: Colors.grey)),
//           const SizedBox(height: 6),
//           Text(title, style: const TextStyle(fontWeight: FontWeight.bold,color: AppColor.gery800)),
//           const SizedBox(height: 15),
//           const Text("Last Update: 17 Oct 2023 ",
//               style: TextStyle(fontSize: 12, color: AppColor.gery800)),
//           const SizedBox(height: 4),
//           const Text("Created: 17 Oct 2023",
//               style: TextStyle(fontSize: 12, color: AppColor.gery800)),
//           const SizedBox(height: 4),
//         //  // const Text(" Ahmed Show Room, Gulshan, Dhaka",
//         //       style: TextStyle(fontSize: 12, color: Color(0xFF0060C8))),
//           Align(
//             alignment: Alignment.centerRight,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: color),
//               ),
//               child: Text(status, style: TextStyle(color: color, fontSize: 12)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

 
// }


// import 'package:flutter/material.dart';



// class CommentsPage extends StatelessWidget {
//   final List<Comment> comments = [
//     Comment(
//       name: "Rihanna Josephine",
//       timeAgo: "2 hours ago",
//       text: "The document looks valid to me @RajeshPandey",
//       label: "Customer KYC",
//       avatarUrl: "https://i.pravatar.cc/150?img=1",
//     ),
//     Comment(
//       name: "Sophey Paul",
//       timeAgo: "23 hours ago",
//       text: "Validation would be needed from GHUP Board of Directors by Friday!",
//       label: "Customer KYC",
//       avatarUrl: "https://i.pravatar.cc/150?img=2",
//     ),
//     Comment(
//       name: "John Selese",
//       timeAgo: "23 hours ago",
//       text: "Hey @Sophey Paul, what are the further steps to be taken?",
//       avatarUrl: "https://i.pravatar.cc/150?img=3",
//     ),
//     Comment(
//       name: "John Selese",
//       timeAgo: "23 hours ago",
//       text: "Hey @Sophey Paul, please take a look.",
//       avatarUrl: "https://i.pravatar.cc/150?img=3",
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(title: Text('Comments'), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Type your comment here",
//                       prefixIcon: Icon(Icons.edit, size: 20),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                   ),
//                   child: Text("Publish"),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.separated(
//               padding: const EdgeInsets.all(12),
//               itemCount: comments.length,
//               separatorBuilder: (_, __) => SizedBox(height: 12),
//               itemBuilder: (context, index) {
//                 final comment = comments[index];
//                 return CommentCard(comment: comment);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Comment {
//   final String name;
//   final String timeAgo;
//   final String text;
//   final String? label;
//   final String avatarUrl;

//   Comment({
//     required this.name,
//     required this.timeAgo,
//     required this.text,
//     this.label,
//     required this.avatarUrl,
//   });
// }

// class CommentCard extends StatelessWidget {
//   final Comment comment;

//   const CommentCard({super.key, required this.comment});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
//       ),
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(backgroundImage: NetworkImage(comment.avatarUrl), radius: 18),
//               SizedBox(width: 10),
//               Expanded(
//                 child: Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "${comment.name} ",
//                         style: TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                       TextSpan(
//                         text: "added a comment ${comment.timeAgo}",
//                         style: TextStyle(color: Colors.grey[600], fontSize: 13),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Icon(Icons.more_vert, color: Colors.grey[700]),
//             ],
//           ),
//           SizedBox(height: 10),
//           Text.rich(
//             _buildTextWithMentions(comment.text),
//             style: TextStyle(fontSize: 15),
//           ),
//           if (comment.label != null) ...[
//             SizedBox(height: 10),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//               decoration: BoxDecoration(
//                 color: Color(0xFFFAE5E5),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.picture_as_pdf, color: Colors.red, size: 18),
//                   SizedBox(width: 6),
//                   Text(comment.label!, style: TextStyle(fontWeight: FontWeight.w500)),
//                 ],
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   TextSpan _buildTextWithMentions(String text) {
//     final words = text.split(' ');
//     return TextSpan(
//       children: words.map((word) {
//         final isMention = word.startsWith('@') || word.contains('@');
//         return TextSpan(
//           text: "$word ",
//           style: TextStyle(
//             color: isMention ? Colors.deepPurple : Colors.black,
//             fontWeight: isMention ? FontWeight.w600 : FontWeight.normal,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // استيراد مكتبة GetX

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp( // استخدم GetMaterialApp بدلاً من MaterialApp
//       debugShowCheckedModeBanner: false,
//       title: 'Edit Profile UI',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const EditProfileScreen(),
//     );
//   }
// }

// تعريف الألوان المخصصة لتتناسب مع التصميم
class AppColors {
  static const Color primaryPurple = Color(0xFF8839B3); // بنفسجي داكن نوعاً ما
  static const Color lightPurple = Color(0xFFBB86FC); // بنفسجي فاتح للأزرار الثانوية
  static const Color backgroundLight = Color(0xFFF0F0F0); // لون الخلفية الفاتح
  static const Color textBlack = Color(0xFF333333);
  static const Color textGrey = Color(0xFF666666);
}


class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.7); 
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height * 0.7);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 3 / 4, size.height * 0.4);
    var secondEndPoint = Offset(size.width, size.height * 0.7);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0); // تكمل للزاوية العلوية اليمنى
    path.close(); // تغلق المسار

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// 1. Controller باستخدام GetX
class EditProfileController extends GetxController {
  // controllers لحقول الإدخال
  final TextEditingController nameController = TextEditingController(text: 'User Name');
  final TextEditingController emailController = TextEditingController(text: 'user@example.com');
  final TextEditingController passwordController = TextEditingController(text: '********'); // لا تعرض كلمة المرور الفعلية

  @override
  void onInit() {
    super.onInit();
    // يمكنك هنا تهيئة البيانات أو جلبها عند بدء تشغيل الـ controller
    print("EditProfileController initialized!");
  }

  @override
  void onClose() {
    // تخلص من الـ controllers عندما لا تكون هناك حاجة إليها
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
    print("EditProfileController disposed!");
  }

  // منطق تغيير الصورة
  void changeProfilePicture() {
    Get.snackbar(
      'تغيير الصورة',
      'سيتم فتح معرض الصور أو الكاميرا.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.lightBlue,
      colorText: Colors.white,
    );
    print('تغيير الصورة');
    // أضف منطق اختيار الصورة هنا
  }

  // منطق حفظ التغييرات
  void saveChanges() {
    Get.snackbar(
      'حفظ التغييرات',
      'تم حفظ بيانات الملف الشخصي.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryPurple,
      colorText: Colors.white,
    );
    print('حفظ التغييرات');
    print('الاسم: ${nameController.text}');
    print('البريد الإلكتروني: ${emailController.text}');
    // أضف منطق حفظ البيانات الفعلية (مثل استدعاء API) هنا
    // لا تحفظ كلمة المرور مباشرة من هنا لأسباب أمنية
  }

  // منطق تغيير كلمة المرور
  void changePassword() {
    Get.defaultDialog(
      title: "تغيير كلمة المرور",
      content: const Column(
        children: [
          TextField(decoration: InputDecoration(labelText: "كلمة المرور القديمة")),
          SizedBox(height: 10),
          TextField(decoration: InputDecoration(labelText: "كلمة المرور الجديدة")),
          SizedBox(height: 10),
          TextField(decoration: InputDecoration(labelText: "تأكيد كلمة المرور الجديدة")),
        ],
      ),
      textConfirm: "تغيير",
      textCancel: "إلغاء",
      onConfirm: () {
        // منطق تحديث كلمة المرور
        Get.back(); // إغلاق الـ dialog
        Get.snackbar(
          'تغيير كلمة المرور',
          'تم تحديث كلمة المرور بنجاح.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      },
    );
    print('تغيير كلمة المرور');
  }

  // منطق إدارة العناوين
  void manageAddresses() {
    Get.snackbar(
      'إدارة العناوين',
      'سيتم الانتقال إلى شاشة إدارة العناوين.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blueAccent,
      colorText: Colors.white,
    );
    print('إدارة العناوين');
    // أضف منطق التنقل إلى شاشة إدارة العناوين هنا
  }

  // منطق تعديل التفضيلات
  void editPreferences() {
    Get.snackbar(
      'تعديل التفضيلات',
      'سيتم الانتقال إلى شاشة تعديل التفضيلات.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blueAccent,
      colorText: Colors.white,
    );
    print('تعديل التفضيلات');
    // أضف منطق التنقل إلى شاشة تعديل التفضيلات هنا
  }
}

// 2. تحديث الشاشة لتستخدم GetBuilder
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تهيئة الـ controller
    return GetBuilder<EditProfileController>(
      init: EditProfileController(), // تهيئة الـ controller عند بناء الواجهة لأول مرة
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.backgroundLight,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () {
                Get.back(); // استخدام Get.back() للعودة
              },
            ),
            title: const Text(
              'تعديل البروفايل',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // الجزء العلوي مع الصورة والشكل المتموج
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    ClipPath(
                      clipper: WavyClipper(),
                      child: Container(
                        height: 250,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    Positioned(
                      top: 100,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          const CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                                'assets/profile_placeholder.jpg'), // ضع مسار صورتك هنا
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: controller
                                  .changeProfilePicture, // استدعاء دالة الـ controller
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: AppColors.lightPurple,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputField(
                        controller: controller.nameController,
                        labelText: 'الاسم',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      _buildInputField(
                        controller: controller.emailController,
                        labelText: 'البريد الإلكتروني',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      _buildPasswordInputField(
                        controller: controller.passwordController,
                        labelText: 'كلمة المرور',
                        icon: Icons.lock,
                        onPressedChangePassword:
                            controller.changePassword, // استدعاء دالة الـ controller
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildActionButton(
                            context,
                            icon: Icons.location_on,
                            label: 'إدارة العناوين',
                            onPressed: controller
                                .manageAddresses, // استدعاء دالة الـ controller
                          ),
                          _buildActionButton(
                            context,
                            icon: Icons.settings,
                            label: 'تعديل التفضيلات',
                            onPressed: controller
                                .editPreferences, // استدعاء دالة الـ controller
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: controller.saveChanges, // استدعاء دالة الـ controller
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryPurple,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                            ),
                            child: const Text(
                              'حفظ التغييرات',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // لا يوجد Bottom Navigation Bar هنا
        );
      },
    );
  }

  // دوال مساعدة _buildInputField و _buildPasswordInputField و _buildActionButton
  // تبقى كما هي من الكود السابق، مع تعديلات بسيطة لتتناسب مع GetX

  Widget _buildInputField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: AppColors.textBlack),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: AppColors.textGrey),
          prefixIcon: Icon(icon, color: AppColors.primaryPurple),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Widget _buildPasswordInputField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required VoidCallback onPressedChangePassword,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        readOnly: true,
        style: const TextStyle(color: AppColors.textBlack),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: AppColors.textGrey),
          prefixIcon: Icon(icon, color: AppColors.primaryPurple),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: TextButton(
            onPressed: onPressedChangePassword,
            child: const Text(
              'تغيير كلمة المرور',
              style: TextStyle(color: AppColors.lightPurple, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppColors.primaryPurple,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            shadowColor: Colors.grey.withOpacity(0.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28),
              const SizedBox(height: 5),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
