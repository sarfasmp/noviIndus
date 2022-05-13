
//Bus list model
class BusListModel {
  BusListModel({
    this.status,
    this.busList,
  });

  bool? status;
  List<BusList>? busList;

  factory BusListModel.fromJson(Map<String, dynamic> json) => BusListModel(
    status: json["status"],
    busList: List<BusList>.from(json["bus_list"].map((x) => BusList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "bus_list": List<dynamic>.from(busList!.map((x) => x.toJson())),
  };
}

class BusList {
  BusList({
    this.id,
    this.name,
    this.image,
    this.seatCount,
    this.type,
    this.driver,
  });

  int? id;
  String? name;
  String? image;
  String? seatCount;
  String? type;
  dynamic? driver;

  factory BusList.fromJson(Map<String, dynamic> json) => BusList(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    seatCount: json["seat_count"],
    type: json["type"],
    driver: json["driver"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "seat_count": seatCount,
    "type": type,
    "driver": driver,
  };
}



//Driver list model
class DriverListModel {
  DriverListModel({
    this.status,
    this.driverList,
  });

  bool? status;
  List<DriverList>? driverList;

  factory DriverListModel.fromJson(Map<String, dynamic> json) => DriverListModel(
    status: json["status"],
    driverList: List<DriverList>.from(json["driver_list"].map((x) => DriverList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "driver_list": List<dynamic>.from(driverList!.map((x) => x.toJson())),
  };
}

class DriverList {
  DriverList({
    this.id,
    this.name,
    this.mobile,
    this.licenseNo,
  });

  int? id;
  String? name;
  String? mobile;
  String? licenseNo;

  factory DriverList.fromJson(Map<String, dynamic> json) => DriverList(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    licenseNo: json["license_no"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "license_no": licenseNo,
  };
}

