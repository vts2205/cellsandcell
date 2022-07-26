class PhoneQrModel {
  PhoneQrModel({
    status,
    message,
    data,
  });
  int? status;
  String? message;
  Data? data;
  
  PhoneQrModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    user,
    qr,
  });
  List<User>? user;
  String? qr;
  
  Data.fromJson(Map<String, dynamic> json){
    user = List.from(json['user']).map((e)=>User.fromJson(e)).toList();
    qr = json['qr'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user!.map((e)=>e.toJson()).toList();
    _data['qr'] = qr;
    return _data;
  }
}

class User {
  User({
    name,
    phone,
   place,
    image,
    currentPosition,
  });
  String? name;
  String? phone;
  
  String? image;
  String? currentPosition;
  
  User.fromJson(Map<String, dynamic> json){
    name = json['name'];
    phone = json['phone'];
    
    image = json['image'];
    currentPosition = json['current_position'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['phone'] = phone;
    
    _data['image'] = image;
    _data['current_position'] = currentPosition;
    return _data;
  }
}