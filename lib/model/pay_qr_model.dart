class PayQRModel {
  PayQRModel({
 status,
 msg,
 data,
  });
  int? status;
  String? msg;
  Data? data;
  
  PayQRModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
 from,
 to,
 amount,
  });
  List<From>? from;
  List<To>? to;
  String? amount;
  
  Data.fromJson(Map<String, dynamic> json){
    from = List.from(json['from']).map((e)=>From.fromJson(e)).toList();
    to = List.from(json['to']).map((e)=>To.fromJson(e)).toList();
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['from'] = from?.map((e)=>e.toJson()).toList();
    _data['to'] = to?.map((e)=>e.toJson()).toList();
    _data['amount'] = amount;
    return _data;
  }
}

class From {
  From({
 id,
 name,
    address,
 phone,
 place,
 image,
 branchId,
 currentPosition,
 userId,
 createdAt,
 updatedAt,
  });
  int? id;
  String? name;
  String? address;
  String? phone;
  String? place;
  String? image;
  int? branchId;
  String? currentPosition;
  String? userId;
  String? createdAt;
  String? updatedAt;
  
  From.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    address = null;
    phone = json['phone'];
    place = json['place'];
    image = json['image'];
    branchId = json['branch_id'];
    currentPosition = json['current_position'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['address'] = address;
    _data['phone'] = phone;
    _data['place'] = place;
    _data['image'] = image;
    _data['branch_id'] = branchId;
    _data['current_position'] = currentPosition;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class To {
  To({
 id,
 name,
    address,
 phone,
 place,
 image,
 branchId,
 currentPosition,
 userId,
 createdAt,
 updatedAt,
  });
  int? id;
  String? name;
  String? address;
  String? phone;
  String? place;
  String? image;
  int? branchId;
  String? currentPosition;
  String? userId;
  String? createdAt;
  String? updatedAt;
  
  To.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    address = null;
    phone = json['phone'];
    place = json['place'];
    image = json['image'];
    branchId = json['branch_id'];
    currentPosition = json['current_position'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['address'] = address;
    _data['phone'] = phone;
    _data['place'] = place;
    _data['image'] = image;
    _data['branch_id'] = branchId;
    _data['current_position'] = currentPosition;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}