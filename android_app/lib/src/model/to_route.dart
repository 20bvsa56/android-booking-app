class ToRoute {
  int id;
  String end_point;

  ToRoute({this.id, this.end_point});

  factory ToRoute.fromJson(Map<String, dynamic> parsedJson) {
    return ToRoute(
        id: parsedJson["id"], 
        end_point: parsedJson["end_point"] ,
        );
  }
}
