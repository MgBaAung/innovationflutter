class PickupModelData {
  bool? success;
  PickupModel? data;
  String? message;

  PickupModelData({this.success, this.data, this.message});

  PickupModelData.from(Map<String, dynamic> json) {
    success = json["success"];
    data = json['data'] != null ? PickupModel.fromJson(json['data']) : null;
    message = json["message"];
  }
}

class PickupModel {
  List<PickupItem>? item;
  int? totalRecords;
  double? totalDue;
  double? totalAmount;
  int? codeSummaryItem;

  PickupModel({
    this.item,
    this.codeSummaryItem,
    this.totalAmount,
    this.totalDue,
    this.totalRecords,
  });

  PickupModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      item = <PickupItem>[];
      json['items'].forEach((v) {
        item!.add(PickupItem.fromJson(v));
      });
    }
    totalAmount = json["totalAmount"];
    totalRecords = json["totalRecords"];
    totalDue = json["totalDue"];
    codeSummaryItem = json["codeSummaryItem"];
  }
}

class PickupItem {
  String? trackingId;
  String? osName;
  String? onTownshipName;
  String? pickupDate;
  int? totalWays;
  String? osPrimaryPhone;

  PickupItem({
    this.totalWays,
    this.onTownshipName,
    this.osName,
    this.osPrimaryPhone,
    this.pickupDate,
    this.trackingId,
  });

  PickupItem.fromJson(Map<String, dynamic> json) {
    totalWays = json["totalWays"];
    onTownshipName = json["osTownshipName"];
    osName = json["osName"];
    osPrimaryPhone = json["osPrimaryPhone"];
    pickupDate = json["pickupDate"];
    trackingId = json["trackingId"];
  }
}
