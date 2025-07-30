import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'usernmae') {
    if (!GetUtils.isUsername(val)) {
      return "not valid userName";
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "not valid Email";
    }




    
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phoneNumber";
    }
  }
  if (val.isEmpty ) {
    return 'cant be is Empty';
  }
  if (val.length < min) {
    return 'value cant be less than $min';
  }
  if (val.length > max) {
    return 'value cant be larger than $max';
  }
 
  
}
