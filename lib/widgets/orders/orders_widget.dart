import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'order_item_widget.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({Key? key}) : super(key: key);

  @override
  _OrdersWidgetState createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 18,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              const Expanded(child: Text('Входящие заказы', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),
              FlutterSwitch(
                value: isOnline,
                onToggle: (bool value) {
                  isOnline = value;
                },
                width: 112,
                height: 30,
                activeText: 'Онлайн',
                inactiveText: 'Офлайн',
              )
            ],
          ),
        ),
        const SizedBox(height: 16,),
        OrderItemWidget(),
        const SizedBox(height: 16,),
        OrderItemWidget(),
        const SizedBox(height: 16,),
        OrderItemWidget(),
      ],
    );
  }
}
