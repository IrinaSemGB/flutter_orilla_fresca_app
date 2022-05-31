import 'package:flutter/material.dart';
import 'package:orilla_fresca/models/subcategory.dart';
import 'package:provider/provider.dart';
import '../helpers/constants.dart';
import '../services/category_selection_service.dart';
import 'category_icon_widget.dart';


class MapBottomPill extends StatelessWidget {

  SubCategory? subCategory;

  @override
  Widget build(BuildContext context) {

    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    subCategory = catSelection.selectedSubCategory;


    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(40.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/${subCategory!.imageName}.png',
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -10.0,
                      right: -10.0,
                      child: CategoryIcon(
                        icon: subCategory!.icon!,
                        color: subCategory!.color!,
                        size: 20.0,
                        padding: 5.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subCategory!.name!,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      Text('Price per pound'),
                      Text(
                        '2 km to destination',
                        style: TextStyle(
                          color: AppColors.GREEN,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.location_pin,
                  color: subCategory!.color,
                  size: 50.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            child: Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      color: subCategory!.color!,
                      width: 4.0,
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/farmer.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jose Gonzalez',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Cheese chop\nLewinsky street #225'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}