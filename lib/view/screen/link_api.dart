class AppLink {
  static const String severNamer = 'http://10.0.2.2:8000/api';
  static const String test = '$severNamer/';

  // image=================================
  static const String imagebaseurl = 'http://10.0.2.2/ecommerce/upload';

  static const String categories = '$imagebaseurl/categories';
  static const String items = '$imagebaseurl/items';

  // ================Auth===================

  static const String signup = 'register-user';
  static const String verfiycodesignup = '$severNamer/auth/verfiycode.php';
  static const String login = '/api/login-user';

  //==========ForgetPassword=================
  static const String sentcode  = '/api/sent_code';
  static const String verifycode = '/api/verify-Reset-Code';
  static const String resetpassword = '/api/reset-password';
  //=========Home==========================
  static const String home = '$severNamer/home.php';

  //==============Items===================
  static const String item = '$severNamer/items/items.php';

  //==============favorite================
  static const String favoriteAdd ='$severNamer/favorit/add.php';
  static const String favoriteRemove ='$severNamer/favorit/remove.php';
  static const String favoriteView ='$severNamer/favorit/view.php';
//=============sevices==============
  static const String classfication ='/api/Classifications';


}
