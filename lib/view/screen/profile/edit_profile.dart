import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:massaclinic/controller/edit_profile_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/view/widget/profile/clip_path_header.dart';
import 'package:massaclinic/view/widget/profile/custom_age_filed.dart';
import 'package:massaclinic/view/widget/profile/custom_text_form_edit_profile.dart';
import 'package:massaclinic/view/widget/profile/location_filed.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileControllerImp());

    void showImageSourceActionSheet() {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () {
                controller.pickImage(ImageSource.camera);
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                controller.pickImage(ImageSource.gallery);
                Get.back();
              },
            ),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<EditProfileControllerImp>(
        builder: (controller) {
          return Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: HeaderClipper(),
                    child: Container(
                      height: 230,
                      width: double.infinity,
                      color: AppColor.primaryColor,
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                "Edit Profile",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(flex: 2),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                             CircleAvatar(
                              radius: 50,
                            backgroundImage: controller.pickedImage != null
          ? FileImage(controller.pickedImage!)
          : (controller.image != null && controller.image!.isNotEmpty
              ? NetworkImage(controller.image!)
              : const AssetImage('assets/images/person.png') as ImageProvider),
                            ),
                           CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(Icons.camera_alt, color: AppColor.thirdColor, size: 20),
                            onPressed: showImageSourceActionSheet,
                          ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
             SizedBox(height: 30,),
                      CustomTextFormEditProfile(
                        controller: controller.nameController,
                        text: 'Name',
                        icon: Icons.person,
                      ),

                      const SizedBox(height: 12),
                      CustomTextFormEditProfile(
                        controller: controller.emailController,
                        text: 'Email',
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormEditProfile(
                        controller: controller.numberController,
                        text: 'Number',
                        icon: Icons.call,
                      ),
                      const SizedBox(height: 12),
                      const CustomAgeField(label: "Age"),
                      const SizedBox(height: 12),
                      CustomLocationField(
                        label: "Location",
                        selectedValue: controller.selectedLocation,
                        items: controller.locations,
                        onChanged: (value) {
                          controller.setLocation(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            minimumSize: Size(double.infinity, 44),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                         onPressed: () {
  controller.saveChanges(
    controller.nameController.text,
    controller.emailController.text,
    controller.numberController.text,
    controller.pickedImage?.path ?? controller.image ?? "",
    controller.age.toString(),
    controller.selectedLocation ?? "",
  );
},
                          child: const Text(
                            "Save Changes",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.thirdColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
