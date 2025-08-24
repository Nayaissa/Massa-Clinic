// import 'package:flutter/material.dart';
// import 'package:massaclinic/core/constant/AppColor.dart';
// import 'package:massaclinic/core/constant/AppImagesAssets.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Splash Screen Demo',
//       home: const SplashScreen(),
//     );
//   }
// }

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );

//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeIn),
//     );

//     _controller.forward();

//     // Navigate to home after 3 seconds
//     Future.delayed(const Duration(seconds: 3), () {
//       // هنا يمكن التنقل للصفحة الرئيسية
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.backgroundColor,
//       body: FadeTransition(
//         opacity: _animation,
//         child: Stack(
//           children: [
//             // خلفية Hexagon
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: CustomPaint(
//                 size: const Size(double.infinity, 150),
//                 painter: HexagonPainter(),
//               ),
//             ),
//             // اللوغو والنص
//             Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset(
//                     AppImageAssets.logoImage, // ضع مسار اللوغو هنا
//                     width: 200,
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Massa Beauty Clinic",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HexagonPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.purple.shade100
//       ..style = PaintingStyle.fill;

//     final path = Path();
//     double w = 40; // عرض كل Hexagon
//     double h = w * 0.866; // ارتفاع Hexagon (تقريبياً)

//     for (double x = 0; x < size.width; x += w * 0.75) {
//       for (double y = 0; y < size.height; y += h) {
//         double offsetY = (x ~/ (w * 0.75)) % 2 == 0 ? 0 : h / 2;
//         path.addPolygon([
//           Offset(x + w * 0.5, y + offsetY),
//           Offset(x + w, y + h / 4 + offsetY),
//           Offset(x + w, y + 3 * h / 4 + offsetY),
//           Offset(x + w * 0.5, y + h + offsetY),
//           Offset(x, y + 3 * h / 4 + offsetY),
//           Offset(x, y + h / 4 + offsetY),
//         ], true);
//       }
//     }

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
