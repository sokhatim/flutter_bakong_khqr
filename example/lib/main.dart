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
  String _qrCodeMerchant = '';
  String _qrCodeIndividual = '';
  final _bakongKhqr = FlutterBakongKhqr();

  @override
  void initState() {
    super.initState();
    _generateKhqrIndividual();
    _generateKhqrMerchant();
  }

  Future<void> _generateKhqrIndividual() async {
    // Call generateKhqrIndividual method and expect a Map response
    final response = await _bakongKhqr.generateKhqrIndividual(
      bakongAccountId: "sokha_tim@aclb",
      acquiringBank: "Dev Bank",
      merchantName: "Sokha Tim",
      currency: KhqrCurrency.khr,
      amount: 100,
    );

    // Assuming response is a Map with keys 'qrCode'
    setState(() {
      _qrCodeIndividual = response.qrCode;
    });
    if (!mounted) return;
  }

  Future<void> _generateKhqrMerchant() async {
    // Call generateKhqrMerchant method and expect a Map response
    final response = await _bakongKhqr.generateKhqrMerchant(
      bakongAccountId: "sokha_tim@aclb",
      merchantId: "123456",
      acquiringBank: "Dev Bank",
      merchantName: "Sokha Tim",
      currency: KhqrCurrency.khr,
      amount: 100,
    );

    // Assuming response is a Map with keys 'qrCode'
    setState(() {
      _qrCodeMerchant = response.qrCode;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("KHQR Individual"),
              BakongKhqrView(
                width: 250,
                amount: 100,
                receiverName: "Sokha Tim",
                currency: KhqrCurrency.khr,
                qr: _qrCodeIndividual,
              ),
              const Text("KHQR Merchant"),
              BakongKhqrView(
                width: 250,
                amount: 100,
                receiverName: "Sokha Tim",
                currency: KhqrCurrency.khr,
                qr: _qrCodeMerchant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
