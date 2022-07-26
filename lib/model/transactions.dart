class TransactionModel {
  TransactionModel({
   status,
   data,
  });
   int? status;
   Data? data;
  
  TransactionModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data?.toJson();
    return _data;
  }
}

class Data {
  Data({
   user,
   transactions,
  });
   List<User>? user;
   List<Transactions>? transactions;
  
  Data.fromJson(Map<String, dynamic> json){
    user = List.from(json['user']).map((e)=>User.fromJson(e)).toList();
    transactions = List.from(json['transactions']).map((e)=>Transactions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user!.map((e)=>e.toJson()).toList();
    _data['transactions'] = transactions!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class User {
  User({
   name,
   phone,
  });
   String? name;
   String? phone;
  
  User.fromJson(Map<String, dynamic> json){
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['phone'] = phone;
    return _data;
  }
}

class Transactions {
  Transactions({
   amount,
   date,
   status,
   from,
   to,
  });
   String? amount;
   String? date;
   String? status;
   String? from;
   String? to;
  
  Transactions.fromJson(Map<String, dynamic> json){
    amount = json['amount'];
    date = json['date'];
    status = json['status'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['date'] = date;
    _data['status'] = status;
    _data['from'] = from;
    _data['to'] = to;
    return _data;
  }
}