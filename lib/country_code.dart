class CountryCodeInfo{

  final String flag;
  final String countryCode;
  final String dialCode;
  final String country;

  CountryCodeInfo({this.flag, this.countryCode, this.country, this.dialCode});

  String get getFlag => flag;
  String get getCountry => country;
  String get getCountryCode => countryCode;

  factory CountryCodeInfo.fromJson(Map<String, dynamic> json) {
    return CountryCodeInfo(
      country: json['name'],
      countryCode: json['code'],
      dialCode: json['dial_code'],
      flag: json['flag'],
    );
  }

}