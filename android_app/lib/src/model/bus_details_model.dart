class BusDetailsModel {
  int vehicleId;
  String startPoint;
  String endPoint;
  String stoppagePoints;
  String vehicleName;
  String vehicleType;
  String services;
  int price;
  int seatRow;
  int seatColumn;
  String seatLayout;
  String departureDate;

  BusDetailsModel(
      {this.vehicleId,
      this.startPoint,
      this.endPoint,
      this.stoppagePoints,
      this.vehicleName,
      this.vehicleType,
      this.services,
      this.price,
      this.seatRow,
      this.seatColumn,
      this.seatLayout,
      this.departureDate});

  BusDetailsModel.fromJson(Map<String, dynamic> json) {
    vehicleId = json['vehicle_id'];
    startPoint = json['start_point'];
    endPoint = json['end_point'];
    stoppagePoints = json['stoppage_points'];
    vehicleName = json['vehicle_name'];
    vehicleType = json['vehicle_type'];
    services = json['services'];
    price = json['price'];
    seatRow = json['seat_row'];
    seatColumn = json['seat_column'];
    seatLayout = json['seat_layout'];
    departureDate = json['departure_date'];
  }

}