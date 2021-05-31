import 'dart:async';

import 'package:country_picker/country_code.dart';
import 'package:country_picker/country_codes.dart';
import 'package:country_picker/picker_view.dart';
import 'package:flutter/material.dart';

class CountryPicker {

  final BuildContext? context;
  final String? title;
  final Function(CountryCodeInfo)? onSelected;
  Color backgroundColor = Colors.white;
  Color foregroundColor = Colors.black;
  double borderRadius = 10.0;

  CountryPicker({this.context, this.title, this.onSelected});

  Future showCountryPicker() {

    return showModalBottomSheet(
      context: this.context!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return PickerView(context: this.context!, title: title, onClose: onClose, onPicked: onSelected,);
      },
    );
  }

  static void onClose(BuildContext context){
    Navigator.pop(context);
  }

  static CountryCodeInfo onPicked(CountryCodeInfo code){
    CountryCodeInfo code = CountryCodeInfo.fromJson(countryCodes[0]);
    return code;
  }
}
