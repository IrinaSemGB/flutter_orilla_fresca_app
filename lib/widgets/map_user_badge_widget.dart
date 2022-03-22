import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class MapUserBadge extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        children: [
          // avatar
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.GREEN,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                image: AssetImage('assets/images/me.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10.0),
          // name my location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current User',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'My location',
                  style: TextStyle(
                    color: AppColors.GREEN,
                  ),
                ),
              ],
            ),
          ),
          // green icon
          Icon(
            Icons.location_pin,
            color: AppColors.GREEN,
            size: 40.0,
          ),
        ],
      ),
    );
  }
}