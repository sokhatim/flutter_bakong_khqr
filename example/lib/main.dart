import 'package:flutter/material.dart';
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
  String _md5Hash = '';
  String deeplink = '';
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
      acquiringBank: "Dev Bank",
      amount: 10000,
      merchantName: "Sokha Tim",
      merchantCity: "PHNOM PENH",
      billNumber: "#12345",
      mobileNumber: "85512233455",
      storeLabel: "Coffee Shop",
      terminalLabel: "Cashier_1",
      upiAccountInformation: "1234567812345678ABCDEFGHIJKLMNO",
      purposeOfTransaction: "Buy coffee",
      merchantAlternateLanguagePreference: "km",
      merchantNameAlternateLanguage: "Sokha",
      merchantCityAlternateLanguage: "Phnom Penh",
    );

    // Assuming response is a Map with keys 'qrCode' and 'md5'
    setState(() {
      _qrCode = response.qrCode;
      _md5Hash = response.md5;
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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "KHQR String :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(
              _qrCode,
              // style: const TextStyle(fontSize: 20),
            ),
            const Divider(),
            const Text(
              "KHQR Image :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            BakongKhqrView(
              merchantName: "Sokha Tim",
              qrString: _qrCode,
              amount: '10000',
            ),
            const Divider(),
            const Text(
              "MD5 String :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(
              _md5Hash,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
