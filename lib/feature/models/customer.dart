import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../config/constants/constant.dart';

class CustomerModel extends Equatable {
  final String id;
  final String name;
  final String phone;
  final String aDate;
  final String eDate;
  final String price;

  const CustomerModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.aDate,
    required this.eDate,
    required this.price,
  });

  static const initial = CustomerModel(
      id: '', name: '', phone: '', aDate: '', eDate: "", price: "");

  CustomerModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? aDate,
    String? eDate,
    String? price,
  }) =>
      CustomerModel(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        aDate: aDate ?? this.aDate,
        eDate: eDate ?? this.eDate,
        price: price ?? this.price,
      );

  Map<String, dynamic> toMap() => {
        Constant.id: id,
        Constant.name: name,
        Constant.phone: phone,
        Constant.aDate: aDate,
        Constant.eDate: eDate,
        Constant.price: price,
      };

  factory CustomerModel.fromMap(Map<String, dynamic> map) => CustomerModel(
        id: map[Constant.id],
        name: map[Constant.name],
        phone: map[Constant.phone],
        aDate: map[Constant.aDate],
        eDate: map[Constant.eDate],
        price: map[Constant.price],
      );

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [
        id,
        name,
        phone,
        aDate,
        eDate,
        price,
      ];
}
