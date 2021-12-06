import 'package:beezone_delivery/widgets/common_widgets/app_colors.dart';
import 'package:beezone_delivery/widgets/common_widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  var controller = MaskedTextController(mask: '+7 (000) 000-00-00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/LogoBee.png', height: 31, fit: BoxFit.fitHeight,),
            const SizedBox(height: 16),
            const Text('Добро пожаловать!', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),),
            const SizedBox(height: 12),
            const Text('Пожалуйста введите ваш телефон:', style: TextStyle(fontSize: 14),),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: '+7 (ХХХ) ХХХ-ХХ-ХХ ',
                isDense: true,
                contentPadding: EdgeInsets.only(bottom: 8, top: 15),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.yellow
                  )
                )
              ),
            )
          ],
        ),
      ),
      floatingActionButton: CustomFloatingButton(
        text: 'Отправить код',
        onTap: (){
          Navigator.of(context).pushNamed('/registration_code');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

