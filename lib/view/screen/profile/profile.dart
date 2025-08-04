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
                                  controller.profileModel?.profileImageUrl !=
                                          null
                                      ? NetworkImage(
                                        controller
                                            .profileModel!
                                            .profileImageUrl!,
                                      )
                                      : AssetImage(AppImageAssets.person),
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
                controller.profileModel?.name ?? "No Name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                controller.profileModel?.email ?? "mmmmmmmm@google.com",
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
                  children: [
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
                    ProfileItem(
                      icon: Icons.logout,
                      label: "Logout",
                      onTap: () {
                        controller.logout();
                      },
                    ),
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
