import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorrowerData {
  String borrowerCode;
  Image img;
  String name;
  String usahaName;
  String jenisUsahaName;
  String kabupaten;
  String provinsi;
  double nilaiPendanaan;
  String tenorPembayaran;
  String sukuBungaLender;
  double proyeksiImbalHasil;
  double adjBungaLender;
  String creditScoreEkf;
  double biayaProvisi;

  BorrowerData({
    this.borrowerCode = '',
    this.img,
    this.name = '',
    this.usahaName = '',
    this.jenisUsahaName = '',
    this.kabupaten = '',
    this.provinsi = '',
    this.nilaiPendanaan = 0.0,
    this.tenorPembayaran = '',
    this.sukuBungaLender = '',
    this.proyeksiImbalHasil = 0.0,
    this.adjBungaLender = 0.0,
    this.creditScoreEkf = '',
    this.biayaProvisi = 0.0,
  });

  factory BorrowerData.fromJson(Map<String, dynamic> json) {
    return BorrowerData(
      borrowerCode: json["borrower_code"],
      img: json["img"] ?? Image.asset('assets/images/unknown.png'),
      name: json["name"],
      usahaName: json["usaha_name"],
      jenisUsahaName: json["jenis_usaha_name"],
      kabupaten: json["kabupaten"],
      provinsi: json["provinsi"],
      nilaiPendanaan: double.parse(json["nilai_pendanaan"]),
      tenorPembayaran: json["tenor_pembayaran"],
      sukuBungaLender: json["suku_bunga_lender"],
      proyeksiImbalHasil: double.parse(json["proyeksi_imbal_hasil"]),
      adjBungaLender: double.parse(json["adj_bunga_lender"]),
      creditScoreEkf: json["credit_score_ekf"],
      biayaProvisi: double.parse(json["biaya_provisi"]),
    );
  }
}
