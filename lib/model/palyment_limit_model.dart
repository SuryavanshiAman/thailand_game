class PaymentLimitsModel {
  int? status;
  Data? data;

  PaymentLimitsModel({this.status, this.data});

  PaymentLimitsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? minimumDepositRupies;
  int? maximumDepositRupies;
  int? minimumWithdrawRupies;
  int? maximumWithdrawRupies;
  int? uSDTMinimumDeposit;
  int? uSDTMaximumDeposit;
  int? uSDTMinimumWithdraw;
  int? uSDTMaximumWithdraw;
  int? depositConversionRate;
  int? withdrawConversionRate;

  Data(
      {this.minimumDepositRupies,
        this.maximumDepositRupies,
        this.minimumWithdrawRupies,
        this.maximumWithdrawRupies,
        this.uSDTMinimumDeposit,
        this.uSDTMaximumDeposit,
        this.uSDTMinimumWithdraw,
        this.uSDTMaximumWithdraw,
        this.depositConversionRate,
        this.withdrawConversionRate});

  Data.fromJson(Map<String, dynamic> json) {
    minimumDepositRupies = json['minimum_deposit_Rupies'];
    maximumDepositRupies = json['maximum_deposit_Rupies'];
    minimumWithdrawRupies = json['minimum_withdraw_Rupies'];
    maximumWithdrawRupies = json['maximum_withdraw_Rupies'];
    uSDTMinimumDeposit = json['USDT_minimum_deposit'];
    uSDTMaximumDeposit = json['USDT_maximum_deposit'];
    uSDTMinimumWithdraw = json['USDT_minimum_withdraw'];
    uSDTMaximumWithdraw = json['USDT_maximum_withdraw'];
    depositConversionRate = json['deposit_conversion_rate'];
    withdrawConversionRate = json['withdraw_conversion_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minimum_deposit_Rupies'] = this.minimumDepositRupies;
    data['maximum_deposit_Rupies'] = this.maximumDepositRupies;
    data['minimum_withdraw_Rupies'] = this.minimumWithdrawRupies;
    data['maximum_withdraw_Rupies'] = this.maximumWithdrawRupies;
    data['USDT_minimum_deposit'] = this.uSDTMinimumDeposit;
    data['USDT_maximum_deposit'] = this.uSDTMaximumDeposit;
    data['USDT_minimum_withdraw'] = this.uSDTMinimumWithdraw;
    data['USDT_maximum_withdraw'] = this.uSDTMaximumWithdraw;
    data['deposit_conversion_rate'] = this.depositConversionRate;
    data['withdraw_conversion_rate'] = this.withdrawConversionRate;
    return data;
  }
}
