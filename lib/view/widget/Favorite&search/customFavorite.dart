import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

// ignore: must_be_immutable
class CustomFavorite extends StatelessWidget {
   CustomFavorite({
    super.key,
    this.imageUrl,
    this.title,
    this.subtitle,
    this.onPressedFav,
    // ignore: non_constant_identifier_names
    this.is_favorite,
  });
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final void Function()? onPressedFav;
  // ignore: non_constant_identifier_names
  int ?is_favorite;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 235, 244),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 2, color: AppColor.thirdColor),
      ),

      // margin: EdgeInsets.o(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl!,
              width: 120,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.gery800,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4, width: 4),
                      Text(
                        'Price:',
                        style: const TextStyle(color: AppColor.gery800),
                      ),

                      Spacer(),
                      Text(
                        subtitle!,
                        style: const TextStyle(color: Colors.green),
                      ),
                      SizedBox(height: 3,)
                    ],
                  ),
                ),

                Row(
                  children: [
                    Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: onPressedFav,
                      icon: Icon(
                        is_favorite!= 0?     Icons.favorite : Icons.favorite_border_outlined,
                        color:  is_favorite!= 0? Colors.redAccent: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
