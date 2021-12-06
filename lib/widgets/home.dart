import 'package:beezone_delivery/widgets/common_widgets/app_colors.dart';
import 'package:flutter/material.dart';

import 'history_order/history_order.dart';
import 'orders/orders_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    OrdersWidget(),
    Text(
      'Index 1: Profile',
    ),
    HistoryOrderWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/BNB_home_icon.png"),
              size: 20,
            ),
            label: 'null',

          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/BNB_profile_icon.png"),
              size: 20,
            ),
            label: 'null',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/BNB_orders_icon.png"),
              size: 20,
            ),
            label: 'null',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        unselectedItemColor: AppColors.grey,
        selectedItemColor: AppColors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

