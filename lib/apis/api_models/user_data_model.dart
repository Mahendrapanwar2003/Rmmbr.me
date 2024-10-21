/*
class UserDataModel {
  bool? success;
  String? message;
  User? user;

  UserDataModel({this.success, this.message, this.user});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? fullName;
  String? email;
  String? password;
  String? phone;
  bool? isEmailVerified;
  bool? isVarified;
  String? dob;
  String? country;
  int? otpCode;
  String? profileImageUrl;
  ProfileImage? profileImage;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.fullName,
        this.email,
        this.password,
        this.phone,
        this.isEmailVerified,
        this.isVarified,
        this.dob,
        this.country,
        this.otpCode,
        this.profileImageUrl,
        this.profileImage,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    isEmailVerified = json['isEmailVerified'];
    isVarified = json['isVarified'];
    dob = json['dob'];
    country = json['country'];
    otpCode = json['otpCode'];
    profileImageUrl = json['profileImageUrl'];
    profileImage = json['profileImage'] != null
        ? ProfileImage.fromJson(json['profileImage'])
        : null;
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['isEmailVerified'] = isEmailVerified;
    data['isVarified'] = isVarified;
    data['dob'] = dob;
    data['country'] = country;
    data['otpCode'] = otpCode;
    data['profileImageUrl'] = profileImageUrl;
    if (profileImage != null) {
      data['profileImage'] = profileImage!.toJson();
    }
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class ProfileImage {
  String? path;
  String? filename;
  String? contentType;

  ProfileImage({this.path, this.filename, this.contentType});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    filename = json['filename'];
    contentType = json['contentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['filename'] = filename;
    data['contentType'] = contentType;
    return data;
  }
}
*/




class UserDataModel {
  bool? success;
  String? message;
  String? token;
  User? user;

  UserDataModel({this.success, this.message, this.token, this.user});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? fullName;
  String? email;
  String? phone;
  bool? isEmailVerified;
  bool? isVarified;
  String? dob;
  String? country;
  int? otpCode;
  String? profileImageUrl;

  User(
      {this.sId,
        this.fullName,
        this.email,
        this.phone,
        this.isEmailVerified,
        this.isVarified,
        this.dob,
        this.country,
        this.otpCode,
        this.profileImageUrl});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    isEmailVerified = json['isEmailVerified'];
    isVarified = json['isVarified'];
    dob = json['dob'];
    country = json['country'];
    otpCode = json['otpCode'];
    profileImageUrl = json['profileImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['isEmailVerified'] = this.isEmailVerified;
    data['isVarified'] = this.isVarified;
    data['dob'] = this.dob;
    data['country'] = this.country;
    data['otpCode'] = this.otpCode;
    data['profileImageUrl'] = this.profileImageUrl;
    return data;
  }
}
