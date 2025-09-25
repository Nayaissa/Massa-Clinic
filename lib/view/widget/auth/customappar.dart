import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:massaclinic/controller/auth/signup_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomAppar extends GetView<SignUpControllerImp> {
  const CustomAppar( {super.key, required this.radius, required this.image ,required this.colorcon,required this.coloriconcam});
  final double radius;
  final String image;
  final Color colorcon;
  final Color coloriconcam;

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return SizedBox(
      height: 235,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: -220,
            left: -140,
            right: -140,
            child: Container(
              width: double.infinity,
              height: 410,
              decoration: BoxDecoration(
                color:colorcon,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            top: 100,
            //  left: 20,
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: AppColor.backgroundColor,
                  radius: 65,
                  child: CircleAvatar(
                    radius: 60,

                    backgroundImage:
                        controller.pickedImage != null
                            ? FileImage(controller.pickedImage!)
                            : AssetImage(image) as ImageProvider,
                    backgroundColor: AppColor.backgroundColor,
                  ),
                ),

                //
                Positioned(
                  bottom: 10,
                  right: 5,
                  child: GestureDetector(
                    // onTap: _pickImage,
                    child: CircleAvatar(
                      radius: radius,
                      backgroundColor: AppColor.primaryColor,
                      child:InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            elevation: 10,
                            builder: (_) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Center(
                                      child: Container(
                                        width: 40,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Center(
                                      child: Text(
                                        "Chosse Source Photo",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.gery800,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Divider(thickness: 1),
                                    ListTile(
                                      leading: const Icon(
                                        Icons.image,
                                        color: Colors.indigo,
                                        size: 28,
                                      ),
                                      title: const Text(
                                        "Gallary",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                        controller.pickImage(
                                          ImageSource.gallery,
                                        );
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.teal,
                                        size: 28,
                                      ),
                                      title: const Text(
                                        "Camera",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                        controller.pickImage(
                                          ImageSource.camera,
                                        );
                                      },
                                    ),
                                    const Divider(thickness: 1),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },

                                     
                                      child: const Text(
                                        "Cancle",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        
                        },
                        child: Icon(
                            Icons.camera_alt,
                            size: 16,
                            color:coloriconcam,
                          
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
