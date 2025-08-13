
import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';


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

class MyCouponsPage extends StatefulWidget {
  const MyCouponsPage({super.key});

  @override
  State<MyCouponsPage> createState() => _MyCouponsPageState();
}

class _MyCouponsPageState extends State<MyCouponsPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Coupon> coupons = [
    Coupon(
      brand: 'Laser Face',
      description: '30% off in your next supply purchase',
      validUntil: 'Valid until: 3rd Aug 2025',
      discount: '30%',
      color1: const Color(0xFF8FC6FF),
      color2: const Color(0xFF5EA6F5),
      imageUrl:
          'assets/images/laserface.jpeg',
          number: 'for 100 person'
    ),
    
    Coupon(
      brand: 'Lip Fcae',
      description: '20% off on any purchase',
      validUntil: 'Valid until: 3rd Aug 2025',
      discount: '20%',
      color1: const Color(0xFF99E1C7),
      color2: const Color(0xFF66C2A2),
      imageUrl:
          'assets/images/fillerface.jpeg',
           number: 'for 100 person'
    ),
    Coupon(
      brand: 'Botox',
      description: 'All socks are buy one get one free',
      validUntil: 'Valid until: 3rd Aug 2025',
      discount: '40%',
      color1: const Color(0xFFFFC1D1),
      color2: const Color(0xFFE48BA0),
      imageUrl:
          'assets/images/botoksface.jpeg',
           number: 'for 100 person'
    ),
  ];

  List<Coupon> _filterCoupons() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) return coupons;
    return coupons
        .where((c) =>
            c.brand.toLowerCase().contains(query) ||
            c.description.toLowerCase().contains(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' coupons',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
         
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _filterCoupons().length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return CouponCard(coupon: _filterCoupons()[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CouponCard extends StatelessWidget {
  final Coupon coupon;
  const CouponCard({super.key, required this.coupon});

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
              height: 110,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: AssetImage(coupon.imageUrl),
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
                    colors: [coupon.color1.withOpacity(0.8), coupon.color2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coupon.brand,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        coupon.description,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      coupon.validUntil,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 80,
            height: 110,
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
                )
              ],
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  coupon.discount,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _isSale(coupon.discount)
                        ? Colors.pink
                        : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _isSale(coupon.discount) ? 'Sale' : 'Discount',
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