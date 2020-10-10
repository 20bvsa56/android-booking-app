class DestinationsModel {
  int id;
  String name;

  DestinationsModel({this.id, this.name});

  DestinationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

}