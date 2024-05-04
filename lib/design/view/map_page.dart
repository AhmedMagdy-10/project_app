import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:project_app/constants/icon_broken.dart';
import 'package:project_app/core/helper/Map_helper/location_helper.dart';
import 'package:project_app/design/view/widgets/map_widgets/map_places_item.dart';
import 'package:project_app/logic/cubit/map_cubit/map_cubit.dart';
import 'package:project_app/logic/cubit/map_cubit/map_states.dart';
import 'package:project_app/logic/data/models/map_suggestion_model.dart';
import 'package:project_app/logic/data/models/place_datails.dart';

import 'package:uuid/uuid.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  static Position? position;

  Future<void> getMyCurrentPosition() async {
    position = await LocationHelper.getPosition();
    setState(() {});
  }

  static final CameraPosition myCurrentLocationCameraPostion = CameraPosition(
    target: LatLng(position!.latitude, position!.longitude),
    zoom: 17,
    bearing: 0.0,
    tilt: 0.0,
  );

  Set<Marker> markerSet = {};
  Marker? placesDetailsMarker;
  PlacesSugestionModel? placesSugestionModel;
  CameraPosition? goToPlacesDetails;
  PlacesDetails? placesDetailsSelected;
  Marker? myCurrentLocationMarker;

  void buildNewCameraToPlaceDetaileSelected() {
    goToPlacesDetails = CameraPosition(
      target: LatLng(placesDetailsSelected!.result.geometry.loaction.lat,
          placesDetailsSelected!.result.geometry.loaction.lng),
      zoom: 14,
      bearing: 0.0,
      tilt: 0.0,
    );
  }

  @override
  void initState() {
    super.initState();
    getMyCurrentPosition();
  }

  void getPlacesSuggestion(String query) {
    final sessionToken = const Uuid().v4();
    final googleMapCubit = BlocProvider.of<GoogleMapCubit>(context);
    googleMapCubit.getMapPlaces(query, sessionToken);
  }

  final FloatingSearchBarController controller = FloatingSearchBarController();

  Widget buildFloatingSearchBar() {
    final isPortait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildSuggestionBloc(),
              buildPlacesDetailsBloc(),
            ],
          ),
        );
      },
      elevation: 6,
      controller: controller,
      hint: '  Find loaction',
      borderRadius: BorderRadius.circular(16),
      height: 52,
      hintStyle: const TextStyle(fontSize: 18),
      queryStyle: const TextStyle(fontSize: 18),
      border: const BorderSide(style: BorderStyle.none),
      margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      iconColor: Colors.blue,
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      onQueryChanged: (query) {
        getPlacesSuggestion(query);
      },
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortait ? 0 : -1,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      openAxisAlignment: 0,
      width: isPortait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
              icon: Icon(
                IconBroken.Location,
                color: Colors.black.withOpacity(0.6),
              ),
              onPressed: () {}),
        )
      ],
    );
  }

  Widget buildPlacesDetailsBloc() {
    return BlocListener<GoogleMapCubit, GoogleMapStates>(
      listener: (context, state) {
        if (state is GoogleMapPlacesSuccessState) {
          placesDetailsSelected = state.placesDetails;
          gotToMySearchPlaceLoaction();
        }
      },
      child: Container(),
    );
  }

  Future<void> gotToMySearchPlaceLoaction() async {
    buildNewCameraToPlaceDetaileSelected();
    final GoogleMapController placesDetailsController =
        await mapController.future;
    placesDetailsController
        .animateCamera(CameraUpdate.newCameraPosition(goToPlacesDetails!));
    buildPlacesDetailsMarkerOnMap();
  }

  void buildPlacesDetailsMarkerOnMap() {
    placesDetailsMarker = Marker(
      markerId: const MarkerId('1'),
      position: goToPlacesDetails!.target,
      infoWindow: InfoWindow(
        title: placesSugestionModel!.description,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      onTap: () {
        buildCurrentLoactionMarkerOnMap();
      },
    );
    upDateUiWithNewMarker(placesDetailsMarker!);
  }

  buildCurrentLoactionMarkerOnMap() {
    myCurrentLocationMarker = Marker(
      markerId: const MarkerId('2'),
      position: LatLng(position!.latitude, position!.longitude),
      infoWindow: const InfoWindow(
        title: 'My current Location',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      onTap: () {},
    );
    upDateUiWithNewMarker(myCurrentLocationMarker!);
  }

  void upDateUiWithNewMarker(Marker marker) {
    setState(() {
      markerSet.add(marker);
    });
  }

  List<PlacesSugestionModel> places = [];

  Widget buildSuggestionBloc() {
    return BlocBuilder<GoogleMapCubit, GoogleMapStates>(
      builder: (context, state) {
        if (state is GoogleMapSuccessState) {
          places = state.placesList;

          if (places.isNotEmpty) {
            return buildPlacesList();
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildPlacesList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: places.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            placesSugestionModel = places[index];
            controller.close();
            getPlacesDetailsLocation();
          },
          child: ResultsPlacesItem(placesModel: places[index]),
        );
      },
    );
  }

  void getPlacesDetailsLocation() {
    final sessiontoken = const Uuid().v4();
    BlocProvider.of<GoogleMapCubit>(context)
        .getPlacesDetails(placesSugestionModel!.placeId, sessiontoken);
  }

  Widget buildMap() {
    return GoogleMap(
      markers: markerSet,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: myCurrentLocationCameraPostion,
      onMapCreated: (GoogleMapController controller) {
        mapController.complete(controller);
      },
    );
  }

  Future<void> backToMyCurrentCameraPosition() async {
    final GoogleMapController controller = await mapController.future;

    controller.animateCamera(
        CameraUpdate.newCameraPosition(myCurrentLocationCameraPostion));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null
              ? buildMap()
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
          buildFloatingSearchBar(),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          onPressed: () {
            backToMyCurrentCameraPosition();
            print(LatLng(position!.latitude, position!.longitude));
          },
          backgroundColor: Colors.blue,
          child: const Icon(IconBroken.Location),
        ),
      ),
    );
  }
}
