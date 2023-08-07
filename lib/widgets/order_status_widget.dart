
import 'package:flavor_fleet_admin_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class OrderStatusWidget extends StatefulWidget {
  final String title;
  final bool isCheck;
   const OrderStatusWidget({
    required this.isCheck,
    required this.title,
    super.key,
  });

  @override
  State<OrderStatusWidget> createState() => _OrderStatusWidgetState();
}

class _OrderStatusWidgetState extends State<OrderStatusWidget> {
  bool isChecked =  false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Checkbox(value: isChecked, onChanged: (value) {
            setState(() {
              isChecked=!isChecked;
            },);
          },),
          const SizedBox(width: 10),
          SmallText(text: widget.title,size: 17,)
        ],
      ),
    );
  }
}