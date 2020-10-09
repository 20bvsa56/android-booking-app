class BusDetailsModel {
  String startPoint;
  String endPoint;
  String stoppagePoints;
  String vehicleName;
  String vehicleType;
  String services;

  BusDetailsModel(
      {this.startPoint,
      this.endPoint,
      this.stoppagePoints,
      this.vehicleName,
      this.vehicleType,
      this.services});

  BusDetailsModel.fromJson(Map<String, dynamic> json) {
    startPoint = json['start_point'];
    endPoint = json['end_point'];
    stoppagePoints = json['stoppage_points'];
    vehicleName = json['vehicle_name'];
    vehicleType = json['vehicle_type'];
    services = json['services'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['start_point'] = this.startPoint;
  //   data['end_point'] = this.endPoint;
  //   data['stoppage_points'] = this.stoppagePoints;
  //   data['vehicle_name'] = this.vehicleName;
  //   data['vehicle_type'] = this.vehicleType;
  //   data['services'] = this.services;
  //   return data;
  // }
}