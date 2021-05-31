import 'dart:async';

import 'package:country_picker/country_code.dart';
import 'package:country_picker/country_codes.dart';
import 'package:country_picker/picker_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryPicker {
  static Future showCountryPicker(
      {required BuildContext context,
      required String title,
      required Widget willDisplayWidget,
        required Function(CountryCodeInfo) onSelected,
      Color backgroundColor = Colors.white,
      Color foregroundColor = Colors.black,
      double borderRadius = 10.0}) {
    // assert(context != null, "context is null!!");
    // assert(willDisplayWidget != null, "willDisplayWidget is null!!");
    // assert(title != null, "title is null!!");
    // assert(onSelected != null, "On Selected is null!!");
    // assert(backgroundColor != null, "backgroundColor is null!!");
    // assert(foregroundColor != null, "foregroundColor is null!!");
    // assert(borderRadius != null, "borderRadius is null!!");

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return PickerView(context: context, title: title, onClose: onClose, onPicked: onSelected,);
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
