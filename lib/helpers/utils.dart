import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/unit_nums.dart';
import 'package:orilla_fresca/models/poster_content.dart';


class Utils {

  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();

  static List<PosterContent> getPosterContent() {
    return [
      PosterContent(
        message: 'Fresh produce, from the ground to your table',
        image: 'poster1',
      ),
      PosterContent(
        message: 'The best assortment of cheese varieties for your pleasure',
        image: 'poster2',
      ),
      PosterContent(
        message: 'Purchase them from the comfort of your mobile device',
        image: 'poster3',
      ),
    ];
  }

  static String weightUnitToString(WeightUnits unit) {
    switch(unit) {
      case WeightUnits.Kg:
        return 'kg.';
      case WeightUnits.Lb:
        return 'lb.';
      case WeightUnits.Oz:
        return 'oz.';
      default:
        return 'lb.';
    }
  }
}