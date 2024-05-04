class PlacesSugestionModel {
  final String placeId;
  final String description;
  final String icon;

  PlacesSugestionModel(
      {required this.placeId, required this.description, required this.icon});

  factory PlacesSugestionModel.fromJson(Map<String, dynamic> json) {
    return PlacesSugestionModel(
      placeId: json["place_id"],
      description: json['name'],
      icon: json["icon"],
    );
  }
}
