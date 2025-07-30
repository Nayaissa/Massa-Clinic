import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/profile_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/view/widget/profile/customsettings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<ProfileControllerImp>(
        builder: (controller) {
          return Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                    ),
                    child: const SafeArea(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: -35,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 48,
                            backgroundColor: AppColor.backgroundColor,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: 
                               controller.profileModel?.profileImageUrl != null ?
                NetworkImage(controller.profileModel!.profileImageUrl!) :
                AssetImage(AppImageAssets.person)
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 14,
                              child: Icon(
                                Icons.camera_alt,
                                size: 16,
                                color: AppColor.thirdColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

               Text(
              controller.profileModel?.name ??  "malak issa",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(height: 4),
               Text(
               controller.profileModel?.email ??  "mmmmmmmm@google.com",
                style: TextStyle(fontSize: 14, color: AppColor.primaryColor),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    ProfileItem(
                      icon: Icons.location_city_outlined,
                      label: "Address",
                    ),
                    ProfileItem(
                      icon: Icons.notifications,
                      label: "Movie Alerts",
                    ),
                    ProfileItem(icon: Icons.settings, label: "Preference"),
                    ProfileItem(
                      icon: Icons.privacy_tip,
                      label: "Privacy Policy",
                    ),
                    ProfileItem(icon: Icons.contact_mail, label: "Contact Us"),
                    ProfileItem(icon: Icons.logout, label: "Logout"),
                  ],
                ),
              ),

              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:massaclinic/controller/profile_controller.dart';
// import 'package:massaclinic/core/constant/AppColor.dart';
// import 'package:massaclinic/core/constant/AppImagesAssets.dart';
// import 'package:massaclinic/view/widget/profile/customsettings.dart';

// class AppColors {
//   static const Color primaryPurple = Color(0xFF8839B3);
//   static const Color lightPurple = Color(0xFFBB86FC);
//   static const Color backgroundLight = Color(0xFFF0F0F0);
//   static const Color textBlack = Color(0xFF333333);
//   static const Color textGrey = Color(0xFF666666);
// }

// class WavyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height * 0.7);
//     var firstControlPoint = Offset(size.width / 4, size.height);
//     var firstEndPoint = Offset(size.width / 2, size.height * 0.7);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     var secondControlPoint = Offset(size.width * 3 / 4, size.height * 0.4);
//     var secondEndPoint = Offset(size.width, size.height * 0.7);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);

//     path.lineTo(size.width, 0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }


// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(ProfileControllerImp());

//     return Scaffold(
//       backgroundColor: AppColor.backgroundColor,
//       body: GetBuilder<ProfileControllerImp>(
//         builder: (controller) {
//           return Column(
//             children: [
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   ClipPath(
//                     clipper: WavyClipper(),
//                     child: Container(
//                       width: double.infinity,
//                       height: 250,
//                       decoration: BoxDecoration(
//                         color: AppColor.primaryColor, 
//                         image: DecorationImage(
//                           image: AssetImage(AppImageAssets.person),
//                           fit: BoxFit.cover, 
//                           colorFilter: ColorFilter.mode(
//                             AppColor.primaryColor.withOpacity(0.4), 
//                             BlendMode.dstATop, 
//                           ),
//                         ),
//                       ),
//                       child: const SafeArea(
//                         child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.only(top: 20, bottom: 20),
//                             child: Text(
//                               'Profile',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: -35,
//                     left: 0,
//                     right: 0,
//                     child: Center(
//                       child: Stack(
//                         children: [
//                           CircleAvatar(
//                             radius: 48,
//                             backgroundColor: AppColor.backgroundColor,
//                             child: CircleAvatar(
//                               radius: 45,
//                               backgroundImage:
//                                   controller.profileModel?.profileImageUrl != null
//                                       ? NetworkImage(controller.profileModel!.profileImageUrl!)
//                                       : AssetImage(AppImageAssets.person) as ImageProvider,
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 0,
//                             right: 0,
//                             child: CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 14,
//                               child: Icon(
//                                 Icons.camera_alt,
//                                 size: 16,
//                                 color: AppColor.thirdColor,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 40),

//               Text(
//                 controller.profileModel?.name ?? "malak issa",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: AppColor.primaryColor,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 controller.profileModel?.email ?? "mmmmmmmm@google.com",
//                 style: TextStyle(fontSize: 14, color: AppColor.primaryColor),
//               ),
//               const SizedBox(height: 20),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: GridView.count(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 15,
//                   mainAxisSpacing: 15,
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   children: const [
//                     ProfileItem(
//                       icon: Icons.location_city_outlined,
//                       label: "Address",
//                     ),
//                     ProfileItem(
//                       icon: Icons.notifications,
//                       label: "Movie Alerts",
//                     ),
//                     ProfileItem(icon: Icons.settings, label: "Preference"),
//                     ProfileItem(
//                       icon: Icons.privacy_tip,
//                       label: "Privacy Policy",
//                     ),
//                     ProfileItem(icon: Icons.contact_mail, label: "Contact Us"),
//                     ProfileItem(icon: Icons.logout, label: "Logout"),
//                   ],
//                 ),
//               ),

//               const Spacer(),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }