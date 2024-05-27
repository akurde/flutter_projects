import 'package:flutter/material.dart';

class UserDataModel{
    List<UserModel>? users;
    int? limit;
    int? skip;
    int? total;

    UserDataModel({this.users, this.limit, this.skip, this.total});

    factory UserDataModel.fromJson(Map<String, dynamic> json){
      List<UserModel> userData = [];

      for(Map<String, dynamic>eachUser in json['users']){
        userData.add(UserModel.fromJson(eachUser));
      }

      return UserDataModel(
        users: userData,
        limit: json['limit'],
        skip: json['skip'],
        total: json['total']
      );
    }
}

class UserModel {
    int? id;
    String? firstName;
    String? lastName;
    String? maidenName;
    int? age;
    String? gender;
    String? email;
    String? phone;
    String? userName;
    String? password;
    String? birthData;
    String? image;
    String? bloodGroup;
    num? height;
    num? weight;
    String? eyeColor;
    String? domain;
    String? ip;
    String? macAddress;
    String? university;
    String? ein;
    String? ssn;
    String? userAgent;
    HairModel? hair;
    AddressModel? address;
    BankModel? bank;
    CompanyModel? company;
    CryptoModel? crypto;

    UserModel({
      this.id
      , this.firstName
      , this.lastName
      , this.maidenName
      , this.age
      , this.gender
      , this.email
      , this.phone
      , this.userName
      , this.password
      , this.birthData
      , this.image
      , this.bloodGroup
      , this.height
      , this.weight
      , this.eyeColor
      , this.domain
      , this.ip
      , this.macAddress
      , this.university
      , this.ein
      , this.ssn
      , this.userAgent
      , this.hair
      , this.address
      , this.bank
      , this.company
      , this.crypto
    });

    factory UserModel.fromJson(Map<String, dynamic> json){
      return UserModel(
          id : json['id'],    
          firstName : json['firstName'],
          lastName : json['lastName'],
          maidenName : json['maidenName'],
          age : json['age'],
          gender : json['gender'],
          email : json['email'],
          phone : json['phone'],
          userName : json['userName'],
          password : json['password'],
          birthData : json['birthData'],
          image : json['image'],
          bloodGroup : json['bloodGroup'],
          height : json['height'],
          weight : json['weight'],
          eyeColor : json['eyeColor'],
          domain : json['domain'],
          ip : json['ip'],
          macAddress : json['macAddress'],
          university : json['university'],
          ein : json['ein'],
          ssn : json['ssn'],
          userAgent : json['userAgent'],
          hair: HairModel.fromJson(json['hair']),
          address : json['address'] != null ? AddressModel.fromJson(json['address']) : null,
          bank: json['bank'] != null ? BankModel.fromJson( json['bank']) : null,
          company: json['company'] != null ? CompanyModel.fromJson(json['company']) : null,
          crypto: json['crypto'] != null ? CryptoModel.fromJson(json['crypto']) : null,
        );
    }
}

class HairModel{
    String? color;
    String? type;

    HairModel({this.color, this.type});
    
    factory HairModel.fromJson(Map<String, dynamic> json){
      return HairModel(
        color: json['color'],
        type: json['type']
      );
    }
}

class AddressModel{
    String? address;
    String? city;
    CoordinatesModel? coordinates;
    String? postalCode;
    String? state;

    AddressModel({this.address, this.city, this.coordinates, this.postalCode, this.state});

    factory AddressModel.fromJson(Map<String, dynamic> json){
      return AddressModel(
        address: json['address'],
        city: json['city'],
        coordinates: CoordinatesModel.fromJson(json['coordinates']),
        postalCode: json['postalCode'],
        state: json['state'],
      );
    }
}

class CoordinatesModel {
    double? lat;
    double? lng;

    CoordinatesModel({this.lat, this.lng});

    factory CoordinatesModel.fromJson(Map<String, dynamic> json){
      return CoordinatesModel(
        lat: json['lat'], 
        lng: json['lng']
        );
    }
}

class BankModel{
    String? cardExpire;
    String? cardNumber;
    String? cardType;
    String? currency;
    String? iban;

    BankModel({this.cardExpire, this.cardNumber, this.cardType, this.currency, this.iban});

    factory BankModel.fromJson(Map<String, dynamic> json){
      return BankModel(
        cardExpire : json['cardExpire'],
        cardNumber : json['cardNumber'],
        cardType : json['cardType'],
        currency : json['currency'],
        iban : json['iban'],
      );
    }
}

class CompanyModel{
    String? department;
    String? name;
    String? title;
    AddressModel? address;

    CompanyModel({this.address, this.department, this.name, this.title});

    factory CompanyModel.fromJson(Map<String, dynamic> json){
      return CompanyModel(
        department: json['department'],
        name: json['name'],
        title: json['title'],
        address: AddressModel.fromJson(json['address']),
      );
    }
}

class CryptoModel{
    String? coin;
    String? wallet;
    String? network;

    CryptoModel({this.coin, this.wallet, this.network});

    factory CryptoModel.fromJson(Map<String, dynamic> json){
      return CryptoModel(
        coin: json['coin'],
        wallet: json['wallet'],
        network: json['network']
      );
    }
}