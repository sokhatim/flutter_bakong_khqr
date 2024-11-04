class BakongKhqrModel {
  final String qrCode;
  final String md5;

  BakongKhqrModel({required this.qrCode, required this.md5});

  // Factory method to create an instance from a Map
  factory BakongKhqrModel.fromMap(Map<String, dynamic> map) {
    return BakongKhqrModel(
      qrCode: map['qrCode'] as String,
      md5: map['md5'] as String? ?? 'No MD5 Hash',
    );
  }
}
