import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class HotelModel {

  const HotelModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambar,
  });

  final int id;
  final String nama;
  final int harga;
  final String gambar;

  factory HotelModel.fromJson(Map<String,dynamic> json) => HotelModel(
    id: json['id'] as int,
    nama: json['nama'].toString(),
    harga: json['harga'] as int,
    gambar: json['gambar'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'harga': harga,
    'gambar': gambar
  };

  HotelModel clone() => HotelModel(
    id: id,
    nama: nama,
    harga: harga,
    gambar: gambar
  );


  HotelModel copyWith({
    int? id,
    String? nama,
    int? harga,
    String? gambar
  }) => HotelModel(
    id: id ?? this.id,
    nama: nama ?? this.nama,
    harga: harga ?? this.harga,
    gambar: gambar ?? this.gambar,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is HotelModel && id == other.id && nama == other.nama && harga == other.harga && gambar == other.gambar;

  @override
  int get hashCode => id.hashCode ^ nama.hashCode ^ harga.hashCode ^ gambar.hashCode;
}
