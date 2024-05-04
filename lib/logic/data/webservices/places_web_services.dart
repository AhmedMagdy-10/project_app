import 'package:dio/dio.dart';
import 'package:project_app/constants/keys.dart';
import 'package:project_app/core/helper/dio_helper.dart';

class PlacesMapServices {
  Future<List<dynamic>> getPlacesSugestion(
      String placeName, String sessiontoken) async {
    try {
      Response response =
          await DioHelper.dio.get(suggestionMapUrl, queryParameters: {
        'keyword': placeName,
        // 'components': 'country:eg',
        'location': '31.0946252,31.9032015',
        // 'types': 'address',
        'radius': '500',
        'key': googleMapApi,
        'sessiontoken': sessiontoken,
      });
      // print(response.data['predictions']);
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<dynamic> getPlacesDetails(String placeId, String sessiontoken) async {
    try {
      Response response =
          await DioHelper.dio.get(placesDetailsMapUrl, queryParameters: {
        'place_id': placeId,
        'fields': 'geometry',
        'key': googleMapApi,
        'sessiontoken': sessiontoken,
      });
      return response.data;
    } catch (e) {
      return Future.error(
        "place Loaction error : ",
        StackTrace.fromString(
          ('this is its trace'),
        ),
      );
    }
  }
}
