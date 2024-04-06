import 'package:firebase_messaging/firebase_messaging.dart';

getUserToken() async {
  await FirebaseMessaging.instance.requestPermission();

  await FirebaseMessaging.instance.getToken().then((value) {
    print(value);
  });
}
