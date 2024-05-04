import 'package:project_app/logic/data/models/map_suggestion_model.dart';
import 'package:project_app/logic/data/models/place_datails.dart';

abstract class GoogleMapStates {}

class GoogleMapInitialState extends GoogleMapStates {}

class GoogleMapLoadingState extends GoogleMapStates {}

class GoogleMapSuccessState extends GoogleMapStates {
  final List<PlacesSugestionModel> placesList;

  GoogleMapSuccessState({required this.placesList});
}

class GoogleMapErrorState extends GoogleMapStates {}

class GoogleMapPlacesSuccessState extends GoogleMapStates {
  final PlacesDetails placesDetails;

  GoogleMapPlacesSuccessState({required this.placesDetails});
}

class GoogleMapPlacesErrorState extends GoogleMapStates {}
