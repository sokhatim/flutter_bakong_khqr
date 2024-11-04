import 'package:flutter_bakong_khqr/model/bakong_khqr_model.dart';
import 'flutter_bakong_khqr_platform_interface.dart';

class FlutterBakongKhqr {
  Future<BakongKhqrModel> generateKhqrIndividual({
    required String bakongAccountId,
    String? accountInformation,
    String? acquiringBank,
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
    required double amount,
    required String merchantName,
    required String merchantCity,
    required String billNumber,
    required String mobileNumber,
    required String storeLabel,
    required String terminalLabel,
    required String upiAccountInformation,
    required String purposeOfTransaction,
    required String merchantAlternateLanguagePreference,
    required String merchantNameAlternateLanguage,
    required String merchantCityAlternateLanguage,
  }) async {
    return FlutterBakongKhqrPlatform.instance.generateKhqrMerchant(
      bakongAccountId: bakongAccountId,
      merchantId: merchantId,
      acquiringBank: acquiringBank,
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
