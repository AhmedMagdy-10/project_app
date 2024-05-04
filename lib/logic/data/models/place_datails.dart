class PlacesDetails {
  final PlacesDetailsResult result;

  PlacesDetails({required this.result});

  factory PlacesDetails.fromJson(dynamic json) {
    return PlacesDetails(
      result: PlacesDetailsResult.fromJson(json['result']),
    );
  }
}

class PlacesDetailsResult {
  final PlacesResultGeometry geometry;

  PlacesDetailsResult({required this.geometry});

  factory PlacesDetailsResult.fromJson(dynamic json) {
    return PlacesDetailsResult(
        geometry: PlacesResultGeometry.fromJson(json['geometry']));
  }
}

class PlacesResultGeometry {
  final Loaction loaction;

  PlacesResultGeometry({required this.loaction});

  factory PlacesResultGeometry.fromJson(dynamic json) {
    return PlacesResultGeometry(loaction: Loaction.fromJson(json['location']));
  }
}

class Loaction {
  final double lat;
  final double lng;

  Loaction({required this.lat, required this.lng});

  factory Loaction.fromJson(dynamic json) {
    return Loaction(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
