class ProfileModel {
  ProfileModel({
    id,
    name,
    profileId,
    isAdmin,
    email,
    phone,
     emailVerifiedAt,
    status,
    createdAt,
    updatedAt,
  });
  int? id;
  String? name;
  int? profileId;
  int? isAdmin;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  int? status;
  String? createdAt;
  String? updatedAt;
  
  ProfileModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??'Name';
    profileId = json['profile_id']??0;
    isAdmin = json['is_admin']??0;
    email = json['email']??'No Email';
    phone = json['phone']??'Phone';
    emailVerifiedAt = json['emailVerifiedAt'];
    status = json['status']??0;
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['profile_id'] = profileId;
    _data['is_admin'] = isAdmin;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}