import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class InfografisModel {

  const InfografisModel({
    required this.hotel,
    required this.makanan,
    required this.wisata,
  });

  final int hotel;
  final int makanan;
  final int wisata;

  factory InfografisModel.fromJson(Map<String,dynamic> json) => InfografisModel(
    hotel: json['hotel'] as int,
    makanan: json['makanan'] as int,
    wisata: json['wisata'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'hotel': hotel,
    'makanan': makanan,
    'wisata': wisata
  };

  InfografisModel clone() => InfografisModel(
    hotel: hotel,
    makanan: makanan,
    wisata: wisata
  );


  InfografisModel copyWith({
    int? hotel,
    int? makanan,
    int? wisata
  }) => InfografisModel(
    hotel: hotel ?? this.hotel,
    makanan: makanan ?? this.makanan,
    wisata: wisata ?? this.wisata,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is InfografisModel && hotel == other.hotel && makanan == other.makanan && wisata == other.wisata;

  @override
  int get hashCode => hotel.hashCode ^ makanan.hashCode ^ wisata.hashCode;
}
