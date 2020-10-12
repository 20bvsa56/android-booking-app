class TicketsModel {
  int id;
  String name;
  String email;
  String phoneNumber;
  int amount;
  String allocatedSeats;
  String title;
  String departureDate;
  String startPoint;
  String endPoint;
  String vehicleName;
  String vehicleType;
  int price;

  TicketsModel(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.amount,
      this.allocatedSeats,
      this.title,
      this.departureDate,
      this.startPoint,
      this.endPoint,
      this.vehicleName,
      this.vehicleType,
      this.price});

  TicketsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    amount = json['amount'];
    allocatedSeats = json['allocated_seats'];
    title = json['title'];
    departureDate = json['departure_date'];
    startPoint = json['start_point'];
    endPoint = json['end_point'];
    vehicleName = json['vehicle_name'];
    vehicleType = json['vehicle_type'];
    price = json['price'];
  }

}