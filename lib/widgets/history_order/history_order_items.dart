import 'package:flutter/material.dart';

class HistoryOrderItem extends StatelessWidget {
  const HistoryOrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('ул.Тимирязева, 52', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  SizedBox(height: 8,),
                  Text('27.11.2021, 12:25'),
                ],
              ),
            ),
            const Text('900 ₸ ', style: TextStyle(fontSize: 16, color: Color.fromRGBO(160, 160, 160, 1)),),
            const SizedBox(width: 12,),
            Image.asset('assets/images/ic_next.png', height: 20,),
          ],
        ),
        const SizedBox(height: 15,),
        const Divider(height: 1, color: Color.fromRGBO(245, 244, 255, 1),)
      ],
    );
  }
}
