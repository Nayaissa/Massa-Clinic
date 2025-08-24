import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/copoun_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/data/model/coupon_model.dart';
import 'package:massaclinic/view/widget/reservation/customappar.dart';

class Coupon {
  final String brand;
  final String description;
  final String validUntil;
  final String discount;
  final Color color1;
  final Color color2;
  final String imageUrl;
  final String number;

  Coupon({
    required this.brand,
    required this.description,
    required this.validUntil,
    required this.discount,
    required this.color1,
    required this.color2,
    required this.imageUrl,
    required this.number,
  });
}

class MyCouponsPage extends StatelessWidget {
  const MyCouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CopounControllerImp());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CopounControllerImp>(
          builder: (controller) {
            return 
            
                
            Column(
              children: [
                CustomApparReservation(
                  icon: Icons.arrow_back_ios,
                  title: 'Coupons',
                ),
                 controller.statusRequest == StatusRequest.loading ?
                Center(child:  Center(child: Lottie.asset(AppImageAssets.loding,repeat: true ,width: 250,height: 200)),)
                 :
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.couponModel!.data!.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
        final item = controller.couponModel!.data!;
        final colors =controller. gradientColors[index %  controller. gradientColors.length];
        return CouponCard(
          coupon: item[index],
          color1: colors[0],
          color2: colors[1],
        );
            },),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CouponCard extends StatelessWidget {
  final Data coupon;
  final Color color1;
  final Color color2;

  const CouponCard({
    super.key,
    required this.coupon,
    required this.color1,
    required this.color2,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: NetworkImage(coupon.image!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  gradient: LinearGradient(
                    colors: [color1.withOpacity(0.5), color1.withOpacity(0.8),color2.withOpacity(0.8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coupon.services![0].name!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        coupon.description!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                     Row(
                      children: [
                         Text(
                          'People available:',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          coupon.numOfParticipant.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],),SizedBox(height: 2,),
                    Row(
                      children: [
                         Text(
                          'Valid Until:',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          coupon.endDate!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 80,
            height: 130,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(30, 0, 0, 0),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${coupon.percentage!.substring(0,2)} %',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:
                        _isSale(coupon.percentage!) ? Colors.pink : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _isSale(coupon.percentage!) ? 'Sale' : 'Discount',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _isSale(String discount) {
    return discount.toLowerCase().contains('sale');
  }
}
