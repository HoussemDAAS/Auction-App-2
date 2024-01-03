import 'dart:core';

class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String pfp;
  final String cin;
  final List<String>? items;
  final List<String>? bids;
  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.pfp,
      required this.cin,
      required this.items,
      required this.bids});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phone: json['phone'],
        pfp: '',
        cin: json["cin"],
        items: json['items'],
        bids: json['bids']);
  }
}
