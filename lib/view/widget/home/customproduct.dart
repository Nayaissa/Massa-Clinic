// import 'package:ecommerce/controller/home_controller.dart';
// import 'package:ecommerce/core/constant/AppColor.dart';
// import 'package:ecommerce/data/model/itemsmodel.dart';
// import 'package:ecommerce/view/linkapi.dart';
// import 'package:flutter/material.dart';
// import 'package:get/state_manager.dart';

// class CustomProductMostSeller extends GetView<HomeControllerImp> {
//   const CustomProductMostSeller({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: controller.items.length,
//         itemBuilder: (context, index) {
//           print(controller.items);
//           return Products(
//             itemsModel: ItemsModel.fromJson(controller.items[index]),
//           );
//         },
//       ),
//     );
//   }
// }

// class Products extends StatelessWidget {
//   const Products({super.key, required this.itemsModel});
//   final ItemsModel itemsModel;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//           margin: EdgeInsets.symmetric(horizontal: 10),
//           child: Image.network(
//             '${AppLink.items}/${itemsModel.itemsImage}',
//             height: 100,
//             width: 160,
//             fit: BoxFit.fill,
//           ),
//         ),

//         Container(
//           // margin: EdgeInsets.symmetric(horizontal: 10,),
//           height: 130,
//           width: 180,
//           decoration: BoxDecoration(
//             color: AppColor.black.withOpacity(0.3),
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//         Positioned(
//           top: 100,
//           left: 12,
//           child: Text(
//             '${itemsModel.itemsName}',
//             style: Theme.of(context).textTheme.displayLarge!.copyWith(
//               color: AppColor.backgroundColor,
//               fontWeight: FontWeight.bold,
//               fontSize: 17,
//             ),
//           ),
//         ),
//       ],
//     );
    
//   }
// }
