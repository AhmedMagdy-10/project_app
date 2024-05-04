class Nearby {
  Nearby({
    required this.results,
  });

  late final List<Results> results;

  factory Nearby.fromJson(Map<String, dynamic> json) {
    return Nearby(
        results: List.from(json['results'])
            .map((e) => Results.fromJson(e))
            .toList());
  }
}

class Results {
  Results({
    required this.icon,
    required this.name,
    required this.placeId,
  });

  late final String icon;

  late final String name;
  late final String placeId;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      icon: json['icon'],
      name: json['name'],
      placeId: json['place_id'],
    );
  }
}
