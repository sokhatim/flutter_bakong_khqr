import 'package:flutter/material.dart';
import 'package:flutter_bakong_khqr/core/khqr_curency.dart';
import 'dart:async';

import 'package:flutter_bakong_khqr/flutter_bakong_khqr.dart';
import 'package:flutter_bakong_khqr/view/bakong_khqr.dart';

void main() {
  runApp(const FlutterBakongKhqrExample());
}

class FlutterBakongKhqrExample extends StatefulWidget {
  const FlutterBakongKhqrExample({super.key});

  @override
  State<FlutterBakongKhqrExample> createState() => _FlutterBakongKhqrExampleState();
}

class _FlutterBakongKhqrExampleState extends State<FlutterBakongKhqrExample> {
  String _qrCode = '';
  final _bakongKhqr = FlutterBakongKhqr();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    // Call generateKhqr method and expect a Map response
    final response = await _bakongKhqr.generateKhqrIndividual(
      bakongAccountId: "sokha_tim@aclb",
      accountInformation: "855979515836",
      amount: 100,
      currency: KhqrCurrency.usd,
      merchantName: "Sokha Tim",
    );

    // Assuming response is a Map with keys 'qrCode' and 'md5'
    setState(() {
      _qrCode = response.qrCode;
    });
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Bakong KHQR Example",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: BakongKhqrView(
            width: 350,
            amount: 100,
            receiverName: "Sokha Tim",
            currency: KhqrCurrency.usd,
            qr: _qrCode,
          ),
        ),
      ),
    );
  }
}
