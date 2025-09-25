import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/services/services_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

// ignore: must_be_immutable
class CustomSearch extends GetView<ServicreControllerImp> {
  CustomSearch({
    super.key,
    this.onTap,
    this.imageUrl,
    this.price,
    this.name,
    this.isFavroite,
    this.description,
    this.id,
    this.totalSession
  });
  void Function()? onTap;
  //  UnifiedServiceModel? services;
  String? imageUrl;
  String? name;
  String? price;
  int? isFavroite;
  String? description;
  int? id;
  int? totalSession;

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
              imageUrl == null ? 'https://i.pravatar.cc/150?img=12' : imageUrl!,
              height: 118,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              name!,
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
                Text('$price\$', style: TextStyle(color: Colors.green)),
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
                    isFavroite != 0
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: isFavroite != 0 ? Colors.red : Colors.grey,
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
                  name!,
                  imageUrl!,
                  description!,
                  price.toString(),
                  id.toString(),
                  totalSession??0
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
