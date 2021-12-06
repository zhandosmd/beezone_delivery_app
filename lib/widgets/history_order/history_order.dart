import 'package:flutter/material.dart';

import 'history_order_items.dart';

class HistoryOrderWidget extends StatefulWidget {
  const HistoryOrderWidget({Key? key}) : super(key: key);

  @override
  _HistoryOrderWidgetState createState() => _HistoryOrderWidgetState();
}

class _HistoryOrderWidgetState extends State<HistoryOrderWidget> {

  void showCustomBottomSheet(){
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 16,),
                Container(
                  color: const Color.fromRGBO(219, 218, 234, 1),
                  height: 4,
                  width: 40,
                ),
                const SizedBox(height: 32,),
                Image.asset('assets/images/map.png', width: 327,)
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          const Text('История заказов', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          const SizedBox(height: 28,),
          Row(
            children: [
              Image.asset('assets/images/ic_calendar.png', height: 24,),
              const SizedBox(width: 8,),
              const Expanded(child: Text('За 3 дня', style: TextStyle(fontSize: 16),)),
              Image.asset('assets/images/ic_datetime.png', height: 24,),
            ],
          ),
          const SizedBox(height: 16,),
          const Divider(height: 1, color: Color.fromRGBO(245, 244, 255, 1),),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index){
                return InkWell(
                  onTap: showCustomBottomSheet,
                  child: Column(
                    children: const [
                      SizedBox(height: 16,),
                      HistoryOrderItem(),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
