import 'dart:convert';

List<Location> locationFromJson(String str) => List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

String locationToJson(List<Location> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Location {
    String id;
    String name;

    Location({
        required this.id,
        required this.name,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
