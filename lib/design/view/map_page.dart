import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:project_app/constants/icon_broken.dart';
import 'package:project_app/core/helper/Map_helper/location_helper.dart';
import 'package:project_app/core/helper/show_toast_state.dart';

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
    target: LatLng(position!.altitude, position!.longitude),
    zoom: 14.4746,
  );
  @override
  void initState() {
    super.initState();
    getMyCurrentPosition();
  }

  Widget buildFloatingSearchBar() {
    final isPortait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final FloatingSearchBarController controller =
        FloatingSearchBarController();

    return FloatingSearchBar(
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
        );
      },
      elevation: 6,
      controller: controller,
      hint: 'Find loaction',
      height: 52,
      hintStyle: const TextStyle(fontSize: 18),
      queryStyle: const TextStyle(fontSize: 18),
      border: const BorderSide(style: BorderStyle.none),
      margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      iconColor: Colors.blue,
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
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

  Widget buildMap() {
    return GoogleMap(
      myLocationEnabled: true,
      mapType: MapType.hybrid,
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
          },
          backgroundColor: Colors.blue,
          child: const Icon(IconBroken.Location),
        ),
      ),
    );
  }
}
