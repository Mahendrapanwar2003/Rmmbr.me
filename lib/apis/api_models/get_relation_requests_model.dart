class GetRelationRequestsModel {
  bool? success;
  String? message;
  List<Requests>? requests;

  GetRelationRequestsModel({this.success, this.message, this.requests});

  GetRelationRequestsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['requests'] != null) {
      requests = <Requests>[];
      json['requests'].forEach((v) {
        requests!.add(new Requests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.requests != null) {
      data['requests'] = this.requests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Requests {
  String? userId;
  String? fullName;
  int? id;
  String? profileImageUrl;
  String? relation;

  Requests(
      {this.userId,
        this.fullName,
        this.id,
        this.profileImageUrl,
        this.relation});

  Requests.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullName = json['fullName'];
    id = json['id'];
    profileImageUrl = json['profileImageUrl'];
    relation = json['relation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['fullName'] = this.fullName;
    data['id'] = this.id;
    data['profileImageUrl'] = this.profileImageUrl;
    data['relation'] = this.relation;
    return data;
  }
}
