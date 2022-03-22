import 'package:flutter/material.dart';
import 'package:orilla_fresca/models/subcategory.dart';
import 'package:orilla_fresca/widgets/main_app_bar_widget.dart';
import '../widgets/map_bottom_pill_widget.dart';
import '../widgets/map_user_badge_widget.dart';


class MapsPage extends StatefulWidget {

  final SubCategory subcategory;
  MapsPage({ required this.subcategory });

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: YandexMap(),
          // ),
          Positioned(
            top: 100.0,
            left: 0.0,
            right: 0.0,
            child: MapUserBadge(),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 80.0,
            child: MapBottomPill(subCategory: widget.subcategory),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 0.0,
            child: MainAppBar(
              showAvatar: false,
            ),
          ),
        ],
      ),
    );
  }
}






