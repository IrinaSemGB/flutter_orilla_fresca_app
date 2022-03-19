import 'package:flutter/material.dart';
import 'package:orilla_fresca/models/subcategory.dart';
import '../models/category_part.dart';

class SubcategoryPartList extends StatefulWidget {

  SubCategory subCategory;
  SubcategoryPartList({ required this.subCategory });

  @override
  State<SubcategoryPartList> createState() => _SubcategoryPartListState();
}

class _SubcategoryPartListState extends State<SubcategoryPartList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.subCategory.parts.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.subCategory.parts.forEach((CategoryPart part) {
                    part.isSelected = widget.subCategory.parts[index] == part;
                  });
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      border: widget.subCategory.parts[index].isSelected
                          ? Border.all(color: widget.subCategory.color, width: 7.0)
                          : null,
                      borderRadius: BorderRadius.circular(25.0),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/' + widget.subCategory.parts[index].imageName + '.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset.zero,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      widget.subCategory.parts[index].name,
                      style: TextStyle(
                        color: widget.subCategory.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
