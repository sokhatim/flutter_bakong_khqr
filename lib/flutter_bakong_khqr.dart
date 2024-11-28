import 'package:flutter_bakong_khqr/core/khqr_curency.dart';
import 'package:flutter_bakong_khqr/model/bakong_khqr_model.dart';
import 'src/flutter_bakong_khqr_platform_interface.dart';

class FlutterBakongKhqr {
  Future<BakongKhqrModel> generateKhqrIndividual({
    required String bakongAccountId,
    String? accountInformation,
    String? acquiringBank,
    KhqrCurrency? currency,
    double? amount,
    required String merchantName,
    String? merchantCity,
    String? billNumber,
    String? mobileNumber,
    String? storeLabel,
    String? terminalLabel,
    String? upiAccountInformation,
    String? purposeOfTransaction,
    String? merchantAlternateLanguagePreference,
    String? merchantNameAlternateLanguage,
    String? merchantCityAlternateLanguage,
  }) {
    return FlutterBakongKhqrPlatform.instance.generateKhqrIndividual(
      bakongAccountId: bakongAccountId,
      accountInformation: accountInformation,
      acquiringBank: acquiringBank,
      currency: currency!.name.toUpperCase(),
      amount: amount,
      merchantName: merchantName,
      merchantCity: merchantCity,
      billNumber: billNumber,
      mobileNumber: mobileNumber,
      storeLabel: storeLabel,
      terminalLabel: terminalLabel,
      upiAccountInformation: upiAccountInformation,
      purposeOfTransaction: purposeOfTransaction,
      merchantAlternateLanguagePreference: merchantAlternateLanguagePreference,
      merchantNameAlternateLanguage: merchantNameAlternateLanguage,
      merchantCityAlternateLanguage: merchantCityAlternateLanguage,
    );
  }

  Future<BakongKhqrModel> generateKhqrMerchant({
    required String bakongAccountId,
    required String merchantId,
    required String acquiringBank,
    KhqrCurrency? currency,
    double? amount,
    required String merchantName,
    String? merchantCity,
    String? billNumber,
    String? mobileNumber,
    String? storeLabel,
    String? terminalLabel,
    String? upiAccountInformation,
    String? purposeOfTransaction,
    String? merchantAlternateLanguagePreference,
    String? merchantNameAlternateLanguage,
    String? merchantCityAlternateLanguage,
  }) async {
    return FlutterBakongKhqrPlatform.instance.generateKhqrMerchant(
      bakongAccountId: bakongAccountId,
      merchantId: merchantId,
      acquiringBank: acquiringBank,
      currency: currency!.name.toUpperCase(),
      amount: amount,
      merchantName: merchantName,
      merchantCity: merchantCity,
      billNumber: billNumber,
      mobileNumber: mobileNumber,
      storeLabel: storeLabel,
      terminalLabel: terminalLabel,
      upiAccountInformation: upiAccountInformation,
      purposeOfTransaction: purposeOfTransaction,
      merchantAlternateLanguagePreference: merchantAlternateLanguagePreference,
      merchantNameAlternateLanguage: merchantNameAlternateLanguage,
      merchantCityAlternateLanguage: merchantCityAlternateLanguage,
    );
  }
}
