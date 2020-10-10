class IndBusDetailsModel {
  int vehicleId;
  String startPoint;
  String endPoint;
  String vehicleName;
  int price;
  int seatRow;
  int seatColumn;
  String seatLayout;
  String departureDate;

  IndBusDetailsModel(
      {this.vehicleId,
      this.startPoint,
      this.endPoint,
      this.vehicleName,
      this.price,
      this.seatRow,
      this.seatColumn,
      this.seatLayout,
      this.departureDate});

  IndBusDetailsModel.fromJson(Map<String, dynamic> json) {
    vehicleId = json['vehicle_id'];
    startPoint = json['start_point'];
    endPoint = json['end_point'];
    vehicleName = json['vehicle_name'];
    price = json['price'];
    seatRow = json['seat_row'];
    seatColumn = json['seat_column'];
    seatLayout = json['seat_layout'];
    departureDate = json['departure_date'];
  }

}