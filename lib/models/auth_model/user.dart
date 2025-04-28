// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? profilePhoto;
  String? gender;
  String? dateOfBirth;
  String? country;
  String? phoneCode;
  String? accountVerified;

  User({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.profilePhoto,
    this.gender,
    this.dateOfBirth,
    this.country,
    this.phoneCode,
    this.accountVerified,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'profilePhoto': profilePhoto,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'country': country,
      'phoneCode': phoneCode,
      'accountVerified': accountVerified,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      profilePhoto: map['profilePhoto'] != null ? map['profilePhoto'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      dateOfBirth: map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      phoneCode: map['phoneCode'] != null ? map['phoneCode'] as String : null,
      accountVerified: map['accountVerified'] != null ? map['accountVerified'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}






