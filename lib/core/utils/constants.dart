import 'package:ensure/core/helpers/custom_extension.dart';

import '../helpers/shared_pref_helper.dart';

class SharedPrefKeys {
  static const String userToken = "userToken";
}
bool isLoggedInUser = false;

 int selectedIndex = 0;

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (! userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}