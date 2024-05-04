import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/logic/cubit/map_cubit/map_states.dart';
import 'package:project_app/logic/data/repository/map_repo.dart';

class GoogleMapCubit extends Cubit<GoogleMapStates> {
  GoogleMapCubit(this.mapRepository) : super(GoogleMapInitialState());
  final MapRepository mapRepository;

  void getMapPlaces(String placeName, String sessiontoken) {
    mapRepository
        .getPlacesSugestion(placeName, sessiontoken)
        .then((sugestions) {
      emit(GoogleMapSuccessState(placesList: sugestions));
      print(sugestions);
    });
  }

  void getPlacesDetails(String placeId, String sessiontoken) {
    mapRepository
        .getPlacesDetails(placeId, sessiontoken)
        .then((placesDetailsList) {
      emit(GoogleMapPlacesSuccessState(placesDetails: placesDetailsList));
    });
  }
}
