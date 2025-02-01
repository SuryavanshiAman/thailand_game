import 'package:flutter/foundation.dart';
import 'package:game/model/palyment_limit_model.dart';
import 'package:game/repo/payment_limit_repo.dart';

class PaymentLimitViewModel with ChangeNotifier {
  final _paymentLimitRepo = PaymentLimitRepo();


  PaymentLimitsModel? _limitData;
  PaymentLimitsModel? get limitData => _limitData;

  setProfile(PaymentLimitsModel value) {
    _limitData = value;
    notifyListeners();
  }

  Future<void> paymentLimitApi(context) async {
    _paymentLimitRepo.paymentLimitApi().then((value) {
      if (value.status == 200) {
        setProfile(value);
      } else {
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('paymentLimitApi: $error');
      }
    });
  }
}

