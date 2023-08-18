import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class WisataModel {

  const WisataModel({
    required this.id,
    required this.nama,
    required this.gambar,
    required this.deskripsi,
    required this.lokasi,
    required this.htm,
  });

  final int id;
  final String nama;
  final String gambar;
  final String deskripsi;
  final String lokasi;
  final int htm;

  factory WisataModel.fromJson(Map<String,dynamic> json) => WisataModel(
    id: json['id'] as int,
    nama: json['nama'].toString(),
    gambar: json['gambar'].toString(),
    deskripsi: json['deskripsi'].toString(),
    lokasi: json['lokasi'].toString(),
    htm: json['htm'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'gambar': gambar,
    'deskripsi': deskripsi,
    'lokasi': lokasi,
    'htm': htm
  };

  WisataModel clone() => WisataModel(
    id: id,
    nama: nama,
    gambar: gambar,
    deskripsi: deskripsi,
    lokasi: lokasi,
    htm: htm
  );


  WisataModel copyWith({
    int? id,
    String? nama,
    String? gambar,
    String? deskripsi,
    String? lokasi,
    int? htm
  }) => WisataModel(
    id: id ?? this.id,
    nama: nama ?? this.nama,
    gambar: gambar ?? this.gambar,
    deskripsi: deskripsi ?? this.deskripsi,
    lokasi: lokasi ?? this.lokasi,
    htm: htm ?? this.htm,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is WisataModel && id == other.id && nama == other.nama && gambar == other.gambar && deskripsi == other.deskripsi && lokasi == other.lokasi && htm == other.htm;

  @override
  int get hashCode => id.hashCode ^ nama.hashCode ^ gambar.hashCode ^ deskripsi.hashCode ^ lokasi.hashCode ^ htm.hashCode;
}
