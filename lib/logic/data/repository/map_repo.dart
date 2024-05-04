import 'package:project_app/logic/data/models/map_suggestion_model.dart';
import 'package:project_app/logic/data/models/place_datails.dart';
import 'package:project_app/logic/data/webservices/places_web_services.dart';

class MapRepository {
  MapRepository({
    required this.placesMapServices,
  });
  final PlacesMapServices placesMapServices;

  Future<List<PlacesSugestionModel>> getPlacesSugestion(
      String placeName, String sessiontoken) async {
    final placesSugestion =
        await placesMapServices.getPlacesSugestion(placeName, sessiontoken);

    return placesSugestion
        .map((sugestions) => PlacesSugestionModel.fromJson(sugestions))
        .toList();
  }

  Future<PlacesDetails> getPlacesDetails(
      String placeId, String sessiontoken) async {
    final placesDetails =
        await placesMapServices.getPlacesDetails(placeId, sessiontoken);

    return PlacesDetails.fromJson(placesDetails);
  }
}
