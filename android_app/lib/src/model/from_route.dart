class FromRoute {
  int id;
  String start_point;

  FromRoute({this.id, this.start_point});

  factory FromRoute.fromJson(Map<String, dynamic> parsedJson) {
    return FromRoute(
        id: parsedJson["id"], 
        start_point: parsedJson["start_point"] ,
        );
  }
}
