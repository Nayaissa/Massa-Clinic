import 'package:get/get.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/core/middleware/mymiddleware.dart';
import 'package:massaclinic/view/screen/Archive/appionment.dart';
import 'package:massaclinic/view/screen/Archive/archive.dart';
import 'package:massaclinic/view/screen/Discounts/discounts_page.dart';
import 'package:massaclinic/view/screen/Home/home_screen.dart';
import 'package:massaclinic/view/screen/Reservations/show_reservation.dart';
import 'package:massaclinic/view/screen/auth/Forgetpassword/foreget_password.dart';
import 'package:massaclinic/view/screen/auth/Forgetpassword/reset_password.dart';
import 'package:massaclinic/view/screen/auth/Forgetpassword/verfiy_code.dart';
import 'package:massaclinic/view/screen/auth/login.dart';
import 'package:massaclinic/view/screen/auth/sign_up.dart';
import 'package:massaclinic/view/screen/auth/success_reset_password.dart';
import 'package:massaclinic/view/screen/auth/success_signup.dart';
import 'package:massaclinic/view/screen/change_password.dart';
import 'package:massaclinic/view/screen/complaints/add_complaints.dart';
import 'package:massaclinic/view/screen/complaints/complaintspage.dart';
import 'package:massaclinic/view/screen/favorite.dart';
import 'package:massaclinic/view/screen/notification_page.dart';
import 'package:massaclinic/view/screen/on_boarding.dart';
import 'package:massaclinic/view/screen/posts/comments.dart';
import 'package:massaclinic/view/screen/profile/edit_profile.dart';
import 'package:massaclinic/view/screen/profile/profile.dart';
import 'package:massaclinic/view/screen/services.dart/details_sevices.dart';
import 'package:massaclinic/view/screen/services.dart/services_page.dart';
import 'package:massaclinic/view/screen/payment/payment_screen.dart';
import 'package:massaclinic/view/screen/splash_screen.dart';

List<GetPage<dynamic>>? getPages = [
  // intro.....
  GetPage(name: '/', page: () => SplashScreen(), middlewares: [MyMiddleWare()]),
  // Auth
    GetPage(name: AppRoute.onBoarding, page: () => OnBoarding()),
  // Auth
  GetPage(name: AppRoute.login, page: () => LoginScreen()),
  GetPage(name: AppRoute.signUp, page: () => SignupScreen()),
  GetPage(name: AppRoute.forgetPassword, page: () => ForegetpassswordScreen()),
  GetPage(name: AppRoute.verfiyCode, page: () => VerfiyCodeScreen()),

  // GetPage(name: AppRoute.verfiyCodeSignUp, page: () => VerfiyCodeSignUp()),
  GetPage(name: AppRoute.resetPassword, page: () => ResetPasswordScreen()),
  GetPage(name: AppRoute.successReset, page: () => SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => OnBoarding()),
  // //Home
  GetPage(name: AppRoute.homepage, page: () => HomeScreen()),
  // Servicres
  GetPage(name: AppRoute.servicespage, page: () => ServicesPage()),
  GetPage(name: AppRoute.detailsservicespage, page: () => DetailsServices()),
  //============posts===========================
  GetPage(name: AppRoute.commentspage, page: () => CommentsPage()),

  //====================== reservation======================
  GetPage(name: AppRoute.reservations, page: () => Reservations()),

  //====================== Complaints======================
  GetPage(name: AppRoute.complaints, page: () => ComplaintPage()),
    GetPage(name: AppRoute.addcomplaints, page: () => AddComplaintPage()),


  //====================== Archive======================
  GetPage(name: AppRoute.archive, page: () => ArchivePage()),
  GetPage(name: AppRoute.appointment, page: () => AppointmentsPage()),

  //======================Profile=========================
  GetPage(name: AppRoute.profile, page: () => ProfilePage()),
    GetPage(name: AppRoute.editprofile, page: () => EditProfile()),

  //======================Favorite=========================
  GetPage(name: AppRoute.favorite, page: () => FavoriteScreen()),
  //======================Discounts=========================
  GetPage(name: AppRoute.discount, page: () => MyCouponsPage()),
//======================Notification=========================
  GetPage(name: AppRoute.notification, page: () => NotificationPage()),

//======================Payment=========================
  GetPage(name: AppRoute.payment, page: () => PaymentScreen()),
GetPage(name: AppRoute.changepassword, page:()=> ChangePasswordScreen() )

];
// Map<String, Widget Function(BuildContext)> routes = {
//   //onBoarding
//   AppRoute.onBoarding: (context) => OnBoarding(),
//   //Auth
//   AppRoute.login: (context) => Login(),
//   AppRoute.signUp: (context) => SignUp(),
//   AppRoute.forgetPassword: (context) => ForgetPassword(),
//   AppRoute.verfiyCode: (context) => VerfiyCode(),
//   // ignore: equal_keys_in_map
//   AppRoute.resetPassword: (context) => ResetPassword(),
//   AppRoute.successReset: (context) => SuccessResetPassword(),
//   AppRoute.successSignUp: (context) => SuccessSignUp(),
// };
