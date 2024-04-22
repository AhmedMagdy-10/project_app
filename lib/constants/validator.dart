import 'package:get/get_utils/src/get_utils/get_utils.dart';

String? validatorInput(String value, String type, int min, int max) {
  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "Not a valid username";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "Not a valid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Not a valid phone number";
    }
  }

  if (type == "password") {
    if (value.isEmpty) {
      return "Password can't be empty";
    }
  }

  if (value.isEmpty) {
    return "Field can't be empty";
  }

  if (value.length < min) {
    return "Value can't be less than $min characters";
  }

  if (value.length > max) {
    return "Value can't be larger than $max characters";
  }

  return null; // Return an empty string if the value passes all validations
}
