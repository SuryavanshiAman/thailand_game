// class ProfileModel {
//   int? success;
//   String? message;
//   Data? data;
//   String? aviatorLink;
//   String? aviatorEventName;
//   String? apkLink;
//   int? usdtPayinAmount;
//   int? usdtPayoutAmount;
//   String? telegram;
//   String? referralCodeUrl;
//   String? lastLoginTime;
//
//   ProfileModel(
//       {this.success,
//         this.message,
//         this.data,
//         this.aviatorLink,
//         this.aviatorEventName,
//         this.apkLink,
//         this.usdtPayinAmount,
//         this.usdtPayoutAmount,
//         this.telegram,
//         this.referralCodeUrl,
//         this.lastLoginTime});
//
//   ProfileModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//     aviatorLink = json['aviator_link'];
//     aviatorEventName = json['aviator_event_name'];
//     apkLink = json['apk_link'];
//     usdtPayinAmount = json['usdt_payin_amount'];
//     usdtPayoutAmount = json['usdt_payout_amount'];
//     telegram = json['telegram'];
//     referralCodeUrl = json['referral_code_url'];
//     lastLoginTime = json['last_login_time'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['success'] = success;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['aviator_link'] = aviatorLink;
//     data['aviator_event_name'] = aviatorEventName;
//     data['apk_link'] = apkLink;
//     data['usdt_payin_amount'] = usdtPayinAmount;
//     data['usdt_payout_amount'] = usdtPayoutAmount;
//     data['telegram'] = telegram;
//     data['referral_code_url'] = referralCodeUrl;
//     data['last_login_time'] = lastLoginTime;
//     return data;
//   }
// }
//
// class Data {
//   int? id;
//   String? name;
//   dynamic wallet;
//   String? uId;
//   String? mobile;
//   dynamic otp;
//   String? email;
//   dynamic accountToken;
//   dynamic emailVerifiedAt;
//   String? password;
//   String? image;
//   String? referralCode;
//   dynamic referrerId;
//   dynamic thirdPartyWallet;
//   dynamic commission;
//   dynamic bonus;
//   dynamic totalReferralBonus;
//   dynamic turnover;
//   dynamic todayTurnover;
//   dynamic totalbet;
//   dynamic firstRecharge;
//   dynamic salaryFirstRecharge;
//   dynamic firstRechargeAmount;
//   dynamic recharge;
//   dynamic verification;
//   dynamic roleId;
//   dynamic dob;
//   dynamic bonusWallet;
//   dynamic totalPayin;
//   dynamic totalPayout;
//   dynamic noOfPayin;
//   dynamic noOfPayout;
//   dynamic yesterdayPayin;
//   dynamic yesterdayRegister;
//   dynamic yesterdayNoOfPayin;
//   dynamic yesterdayFirstDeposit;
//   dynamic yesterdayTotalCommission;
//   dynamic winningWallet;
//   dynamic depositAmount;
//   dynamic withdrawBalance;
//   dynamic winLoss;
//   dynamic type;
//   dynamic status;
//   String? createdAt;
//   String? updatedAt;
//
//   Data(
//       {this.id,
//         this.name,
//         this.wallet,
//         this.uId,
//         this.mobile,
//         this.otp,
//         this.email,
//         this.accountToken,
//         this.emailVerifiedAt,
//         this.password,
//         this.image,
//         this.referralCode,
//         this.referrerId,
//         this.thirdPartyWallet,
//         this.commission,
//         this.bonus,
//         this.totalReferralBonus,
//         this.turnover,
//         this.todayTurnover,
//         this.totalbet,
//         this.firstRecharge,
//         this.salaryFirstRecharge,
//         this.firstRechargeAmount,
//         this.recharge,
//         this.verification,
//         this.roleId,
//         this.dob,
//         this.bonusWallet,
//         this.totalPayin,
//         this.totalPayout,
//         this.noOfPayin,
//         this.noOfPayout,
//         this.yesterdayPayin,
//         this.yesterdayRegister,
//         this.yesterdayNoOfPayin,
//         this.yesterdayFirstDeposit,
//         this.yesterdayTotalCommission,
//         this.winningWallet,
//         this.depositAmount,
//         this.withdrawBalance,
//         this.winLoss,
//         this.type,
//         this.status,
//         this.createdAt,
//         this.updatedAt});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     wallet = json['wallet'];
//     uId = json['u_id'];
//     mobile = json['mobile'];
//     otp = json['otp'];
//     email = json['email'];
//     accountToken = json['account_token'];
//     emailVerifiedAt = json['email_verified_at'];
//     password = json['password'];
//     image = json['image'];
//     referralCode = json['referral_code'];
//     referrerId = json['referrer_id'];
//     thirdPartyWallet = json['third_party_wallet'];
//     commission = json['commission'];
//     bonus = json['bonus'];
//     totalReferralBonus = json['total_referral_bonus'];
//     turnover = json['turnover'];
//     todayTurnover = json['today_turnover'];
//     totalbet = json['totalbet'];
//     firstRecharge = json['first_recharge'];
//     salaryFirstRecharge = json['salary_first_recharge'];
//     firstRechargeAmount = json['first_recharge_amount'];
//     recharge = json['recharge'];
//     verification = json['verification'];
//     roleId = json['role_id'];
//     dob = json['dob'];
//     bonusWallet = json['bonus_wallet'];
//     totalPayin = json['total_payin'];
//     totalPayout = json['total_payout'];
//     noOfPayin = json['no_of_payin'];
//     noOfPayout = json['no_of_payout'];
//     yesterdayPayin = json['yesterday_payin'];
//     yesterdayRegister = json['yesterday_register'];
//     yesterdayNoOfPayin = json['yesterday_no_of_payin'];
//     yesterdayFirstDeposit = json['yesterday_first_deposit'];
//     yesterdayTotalCommission = json['yesterday_total_commission'];
//     winningWallet = json['winning_wallet'];
//     depositAmount = json['deposit_amount'];
//     withdrawBalance = json['withdraw_balance'];
//     winLoss = json['win_loss'];
//     type = json['type'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['wallet'] = wallet;
//     data['u_id'] = uId;
//     data['mobile'] = mobile;
//     data['otp'] = otp;
//     data['email'] = email;
//     data['account_token'] = accountToken;
//     data['email_verified_at'] = emailVerifiedAt;
//     data['password'] = password;
//     data['image'] = image;
//     data['referral_code'] = referralCode;
//     data['referrer_id'] = referrerId;
//     data['third_party_wallet'] = thirdPartyWallet;
//     data['commission'] = commission;
//     data['bonus'] = bonus;
//     data['total_referral_bonus'] = totalReferralBonus;
//     data['turnover'] = turnover;
//     data['today_turnover'] = todayTurnover;
//     data['totalbet'] = totalbet;
//     data['first_recharge'] = firstRecharge;
//     data['salary_first_recharge'] = salaryFirstRecharge;
//     data['first_recharge_amount'] = firstRechargeAmount;
//     data['recharge'] = recharge;
//     data['verification'] = verification;
//     data['role_id'] = roleId;
//     data['dob'] = dob;
//     data['bonus_wallet'] = bonusWallet;
//     data['total_payin'] = totalPayin;
//     data['total_payout'] = totalPayout;
//     data['no_of_payin'] = noOfPayin;
//     data['no_of_payout'] = noOfPayout;
//     data['yesterday_payin'] = yesterdayPayin;
//     data['yesterday_register'] = yesterdayRegister;
//     data['yesterday_no_of_payin'] = yesterdayNoOfPayin;
//     data['yesterday_first_deposit'] = yesterdayFirstDeposit;
//     data['yesterday_total_commission'] = yesterdayTotalCommission;
//     data['winning_wallet'] = winningWallet;
//     data['deposit_amount'] = depositAmount;
//     data['withdraw_balance'] = withdrawBalance;
//     data['win_loss'] = winLoss;
//     data['type'] = type;
//     data['status'] = status;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
class ProfileModel {
  int? status;
  String? message;
  String? aviatorLink;
  String? aviatorEventName;
  dynamic charges;
  Data? data;

  ProfileModel({this.status, this.message, this.data, this.aviatorLink,this.aviatorEventName,this.charges});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    aviatorLink = json['aviator_link'];
    aviatorEventName = json['aviator_event_name'];
    charges = json['charges'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['aviator_link'] = aviatorLink;
    data['aviator_event_name'] = aviatorEventName;
    data['charges'] = charges;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic name;
  dynamic wallet;
  dynamic uId;
  dynamic countryCode;
  dynamic mobile;
  dynamic otp;
  dynamic email;
  dynamic accountToken;
  dynamic emailVerifiedAt;
  dynamic password;
  dynamic image;
  dynamic referralCode;
  dynamic referrerId;
  dynamic thirdPartyWallet;
  dynamic commission;
  dynamic bonus;
  dynamic totalReferralBonus;
  dynamic turnover;
  dynamic todayTurnover;
  dynamic totalbet;
  dynamic firstRecharge;
  dynamic salaryFirstRecharge;
  dynamic firstRechargeAmount;
  dynamic recharge;
  dynamic verification;
  dynamic roleId;
  dynamic dob;
  dynamic bonusWallet;
  dynamic totalPayin;
  dynamic totalPayout;
  dynamic noOfPayin;
  dynamic noOfPayout;
  dynamic yesterdayPayin;
  dynamic yesterdayRegister;
  dynamic yesterdayNoOfPayin;
  dynamic yesterdayFirstDeposit;
  dynamic yesterdayTotalCommission;
  dynamic winningWallet;
  dynamic depositAmount;
  dynamic withdrawBalance;
  dynamic winLoss;
  dynamic type;
  dynamic rememberToken;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic totalBalance;
  dynamic currentDate;

  Data(
      {this.id,
        this.name,
        this.wallet,
        this.uId,
        this.countryCode,
        this.mobile,
        this.otp,
        this.email,
        this.accountToken,
        this.emailVerifiedAt,
        this.password,
        this.image,
        this.referralCode,
        this.referrerId,
        this.thirdPartyWallet,
        this.commission,
        this.bonus,
        this.totalReferralBonus,
        this.turnover,
        this.todayTurnover,
        this.totalbet,
        this.firstRecharge,
        this.salaryFirstRecharge,
        this.firstRechargeAmount,
        this.recharge,
        this.verification,
        this.roleId,
        this.dob,
        this.bonusWallet,
        this.totalPayin,
        this.totalPayout,
        this.noOfPayin,
        this.noOfPayout,
        this.yesterdayPayin,
        this.yesterdayRegister,
        this.yesterdayNoOfPayin,
        this.yesterdayFirstDeposit,
        this.yesterdayTotalCommission,
        this.winningWallet,
        this.depositAmount,
        this.withdrawBalance,
        this.winLoss,
        this.type,
        this.rememberToken,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.totalBalance,
        this.currentDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    wallet = json['wallet'];
    uId = json['u_id'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    otp = json['otp'];
    email = json['email'];
    accountToken = json['account_token'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    image = json['image'];
    referralCode = json['referral_code'];
    referrerId = json['referrer_id'];
    thirdPartyWallet = json['third_party_wallet'];
    commission = json['commission'];
    bonus = json['bonus'];
    totalReferralBonus = json['total_referral_bonus'];
    turnover = json['turnover'];
    todayTurnover = json['today_turnover'];
    totalbet = json['totalbet'];
    firstRecharge = json['first_recharge'];
    salaryFirstRecharge = json['salary_first_recharge'];
    firstRechargeAmount = json['first_recharge_amount'];
    recharge = json['recharge'];
    verification = json['verification'];
    roleId = json['role_id'];
    dob = json['dob'];
    bonusWallet = json['bonus_wallet'];
    totalPayin = json['total_payin'];
    totalPayout = json['total_payout'];
    noOfPayin = json['no_of_payin'];
    noOfPayout = json['no_of_payout'];
    yesterdayPayin = json['yesterday_payin'];
    yesterdayRegister = json['yesterday_register'];
    yesterdayNoOfPayin = json['yesterday_no_of_payin'];
    yesterdayFirstDeposit = json['yesterday_first_deposit'];
    yesterdayTotalCommission = json['yesterday_total_commission'];
    winningWallet = json['winning_wallet'];
    depositAmount = json['deposit_amount'];
    withdrawBalance = json['withdraw_balance'];
    winLoss = json['win_loss'];
    type = json['type'];
    rememberToken = json['remember_token'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalBalance = json['totalBalance'];
    currentDate = json['currentDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['wallet'] = wallet;
    data['u_id'] = uId;
    data['country_code'] = countryCode;
    data['mobile'] = mobile;
    data['otp'] = otp;
    data['email'] = email;
    data['account_token'] = accountToken;
    data['email_verified_at'] = emailVerifiedAt;
    data['password'] = password;
    data['image'] = image;
    data['referral_code'] = referralCode;
    data['referrer_id'] = referrerId;
    data['third_party_wallet'] = thirdPartyWallet;
    data['commission'] = commission;
    data['bonus'] = bonus;
    data['total_referral_bonus'] = totalReferralBonus;
    data['turnover'] = turnover;
    data['today_turnover'] = todayTurnover;
    data['totalbet'] = totalbet;
    data['first_recharge'] = firstRecharge;
    data['salary_first_recharge'] = salaryFirstRecharge;
    data['first_recharge_amount'] = firstRechargeAmount;
    data['recharge'] = recharge;
    data['verification'] = verification;
    data['role_id'] = roleId;
    data['dob'] = dob;
    data['bonus_wallet'] = bonusWallet;
    data['total_payin'] = totalPayin;
    data['total_payout'] = totalPayout;
    data['no_of_payin'] = noOfPayin;
    data['no_of_payout'] = noOfPayout;
    data['yesterday_payin'] = yesterdayPayin;
    data['yesterday_register'] = yesterdayRegister;
    data['yesterday_no_of_payin'] = yesterdayNoOfPayin;
    data['yesterday_first_deposit'] = yesterdayFirstDeposit;
    data['yesterday_total_commission'] = yesterdayTotalCommission;
    data['winning_wallet'] = winningWallet;
    data['deposit_amount'] = depositAmount;
    data['withdraw_balance'] = withdrawBalance;
    data['win_loss'] = winLoss;
    data['type'] = type;
    data['remember_token'] = rememberToken;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['totalBalance'] = totalBalance;
    data['currentDate'] = currentDate;
    return data;
  }
}

