import 'package:flutter/material.dart';
import '../helpers/constants.dart';

class PriceCountWidget extends StatefulWidget {

  int amount = 0;
  double price = 15.0;
  double cost = 0.0;

  @override
  State<PriceCountWidget> createState() => _PriceCountWidgetState();
}

class _PriceCountWidgetState extends State<PriceCountWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Unit: '),
                  TextSpan(text: 'Pound ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '(max. 20)', style: TextStyle(fontSize: 12.0)),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: widget.amount < 20 ? () {
                  setState(() {
                    widget.amount++;
                    widget.cost = widget.price * widget.amount;
                  });
                } : null,
                child: Icon(
                  Icons.add_circle_outline,
                  size: 50.0,
                  color: AppColors.MEATS,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: widget.amount.toString(), style: TextStyle(fontSize: 40.0,),),
                    TextSpan(text: 'lbs.', style: TextStyle(fontSize: 20.0,),),
                  ],
                ),
              ),
              GestureDetector(
                onTap: widget.amount > 0 ? () {
                  setState(() {
                    widget.amount--;
                    widget.cost = widget.price * widget.amount;
                  });
                } : null,
                child: Icon(
                  Icons.remove_circle_outline,
                  size: 50.0,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: ('Price: ')),
                    TextSpan(
                      text: '\$${widget.price} / lb.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                '\$${widget.cost}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
