import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/constants.dart';

class FavoritesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.favorite, color: AppColors.GREEN),
              SizedBox(width: 10.0),
              Text(
                'Favorite',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}