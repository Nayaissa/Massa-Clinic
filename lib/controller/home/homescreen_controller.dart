import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/view/screen/Home/home_page.dart';
import 'package:massaclinic/view/screen/posts/show_posts.dart';
import 'package:massaclinic/view/screen/profile/profile.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listpage = [
   HomePage(),
    // Column(children: [Center(child: Text('Settings'))]),
       SocialPosts(),

   ProfilePage(),
  ];
  List titlebottomappar = [
    'home',
     'Posts',

     'profile',


  ];
  List<IconData> icon = [
   Icons.home_outlined,
      // Icons.settings_outlined,
                  Icons.message_outlined,

         Icons.person_outline,






  ];
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
