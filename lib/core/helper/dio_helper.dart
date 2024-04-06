import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
      headers: {
        'Content-Type': 'application/json',
      },
    ));
  }

  Future<Response> postDate(
      {required String url,
      Map<String, dynamic>? data,
      required String token}) async {
    dio.options.headers = {
      'Authorization': token,
    };

    return await dio.post(
      url,
      data: data,
    );
  }
}
