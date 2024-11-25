<div align="center">
  <h1 align="start" style="font-size: 50px;">Flutter Bakong KHQR</h1>
</div>

<div align="center">
<p align="center">
Simplify your life with Cambodia's only all-in-one mobile payment and banking app. Bakong redefines mobile payment and banking by combining e-wallets, mobile payments, online banking and financial applications within one easy-to-use interface for any preferred bank account. Stop switching between apps today and enjoy unrivalled simplicity, convenience and security with Bakong.
</p>
</div>

---

<p align="center">
  <img src="https://github.com/sokhatim/flutter_bakong_khqr/blob/main/assets/flutter_bakong_khqr_view.jpg?raw=true" width="740" alt="flutter bankong khqr view"/>
</p>

## Requirements

- Flutter >=3.3.0
- Dart >= ^3.5.3
- Android compileSDK 34
- Java 17
- Android Gradle Plugin >= 8.3.0
- Gradle wrapper >= 8.4

## Supported Platforms
- [x] Android

## Features Supported

See the example app for detailed implementation information.

| Features            | Android | iOS     |
|---------------------|---------|---------|
| Generate Individual |    ✔    |    x    |
| Generate Merchant   |    ✔    |    x    |


## Platform specific setup

### Android
- No need to do anything it's working out of the box.

## Usage
### Create instance of KHQR SDK
```dart
import 'package:flutter_bakong_khqr/flutter_bakong_khqr.dart';

final _bakongKhqr = FlutterBakongKhqr();

```

### Generate KHQR (Individual)
```dart
final response = await _bakongKhqr.generateKhqrIndividual(
    bakongAccountId: "sokha_tim@aclb",
    accountInformation: "855979515836",
    amount: 100,
    currency: KhqrCurrency.usd,
    merchantName: "Sokha Tim",
);
```

### Generate KHQR (Merchant)
```dart
final response = await _bakongKhqr.generateKhqrMerchant(
    bakongAccountId: "sokha_tim@aclb",
    merchantId: '', //your merchant id
    acquiringBank: '', // your acquiringBank
    amount: 100,
    currency: KhqrCurrency.usd,
    merchantName: "Sokha Tim",
);
```

### Response data
```dart
 setState(() {
    _qrCode = response.qrCode;
});
```

### KHQR View
```dart
BakongKhqrView(
    width: 350,
    amount: 100,
    receiverName: "Sokha Tim",
    currency: KhqrCurrency.usd,
    qr: _qrCode,
)
```
