import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/services/services_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/data/model/unified_service_model.dart';

// ignore: must_be_immutable
class CustomCardService extends GetView<ServicreControllerImp> {
   CustomCardService({super.key, this.services,this.onTap,this.imageUrl,this.price,this.name});
  void Function()? onTap;
   UnifiedServiceModel? services;
   String ?imageUrl;
   String? name;
   String ? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 235, 244),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: AppColor.thirdColor),
        boxShadow: const [BoxShadow(color: AppColor.thirdColor, blurRadius: 1)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              services?.image == null ? 'https://i.pravatar.cc/150?img=12' : services!.image ,
              height: 118,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
                services!.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColor.grey,
              ),
            ),
          ),
          SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text('Price :', style: TextStyle(color: AppColor.gery800)),
                Spacer(),
                Text(
                  services!.price.toString() + '\$',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Spacer(),
                InkWell(
                  onTap: onTap,
                  child: Icon(
                    services!.is_Favorite != 0
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color:
                        services!.is_Favorite != 0
                            ? Colors.red
                            : Colors.grey,
                    size: 19,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              onPressed: () {
                controller.goToDetailsSer(
                  services!.name,
                  services!.image,
                  services!.description,
                  services!.price.toString(),
                  services!.id.toString(),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(30),
                backgroundColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'registe now',
                style: TextStyle(color: AppColor.thirdColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
