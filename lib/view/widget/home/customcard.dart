// import 'package:flutter/material.dart';
// import 'package:massaclinic/core/constant/AppColor.dart';

// class CustomCard extends StatelessWidget {
//   const CustomCard({super.key, required this.title, required this.subtitle});
//   final String title;
//     final String subtitle;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 20),
//       child: Stack(
//         children: [
//           Container(
//             height: 160,
//             decoration: BoxDecoration(
//               color: AppColor.primaryColor,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: ListTile(
//               title: Text(
//                 title,
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//               subtitle: Text(
//                 subtitle,
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   textBaseline: TextBaseline.alphabetic,
//                 ),
//               ),
//             ),
//           ),

//           Positioned(
//             top: -30,
//             right: -60,

//             child: Container(
//               // height: 160,
//               // width: 160,
//               // decoration: BoxDecoration(
//               //   color:  AppColor.thirdColor,
//               //   borderRadius: BorderRadius.circular(160),
                
//               // ),
//               child: Image.asset('assets/images/sale.png',fit: BoxFit.fill,),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomCarousel extends StatefulWidget {
  final List<String> images; 
  const CustomCarousel({super.key, required this.images});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);

    // Auto play
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final scale = _currentPage == index ? 1.0 : 0.9;

              return AnimatedScale(
                scale: scale,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        // Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentPage == index ? AppColor.thirdColor : Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        ),
      ],
    );
  }
}