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

> [!NOTE]
> If there is any problem, you can watch the video below.
> 
> <small>[Click here to watch video in YouTube](https://youtu.be/OPgf9F1CEdE)
> </small>

## Requirements

- Flutter >=3.3.0
- Dart >= ^3.5.3
- Android compileSDK 34
- Java 17
- Android Gradle Plugin >= 8.3.0
- Gradle wrapper >= 8.4
- iOS 12.0
- Swift Version 5.0

## Supported Platforms
- [x] Android
- [x] iOS

## Features Supported

See the example app for detailed implementation information.

| Features            | Android | iOS     |
|---------------------|---------|---------|
| Generate Individual |    ✔    |    ✔    |
| Generate Merchant   |    ✔    |    ✔    |


## Platform specific setup

### Android
- No need to do anything it's working out of the box.

### iOS
1. Add source to Podfile (**`ios/Podfile`**)

```bash
source "https://sambo:ycfXmxxRbyzEmozY9z6n@gitlab.nbc.gov.kh/khqr/khqr-ios-pod.git"
```
2. Go to **`iOS`** folder
```bash
cd ios
```

2. Run **`pod install`**
```bash
pod install
```

## Usage
### Create instance of FlutterBakongKhqr
```dart
import 'package:flutter_bakong_khqr/flutter_bakong_khqr.dart';

final _bakongKhqr = FlutterBakongKhqr();

```

### Generate KHQR (Individual)
```dart
final response = await _bakongKhqr.generateKhqrIndividual(
  bakongAccountId: "sokha_tim@aclb",
  acquiringBank: "Dev Bank",
  merchantName: "Sokha Tim",
  currency: KhqrCurrency.khr,
  amount: 100,
);
```

### Generate KHQR (Merchant)
```dart
final response = await _bakongKhqr.generateKhqrMerchant(
  bakongAccountId: "sokha_tim@aclb",
  merchantId: "123456",
  acquiringBank: "Dev Bank",
  merchantName: "Sokha Tim",
  currency: KhqrCurrency.khr,
  amount: 100,
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
