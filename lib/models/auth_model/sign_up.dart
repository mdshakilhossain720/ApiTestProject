// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpModel {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? country;
  String? phoneCode;

  SignUpModel({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.country,
    this.phoneCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'country': country,
      'phoneCode': phoneCode,
    };
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      phoneCode: map['phoneCode'] != null ? map['phoneCode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) => SignUpModel.fromMap(json.decode(source) as Map<String, dynamic>);
}



