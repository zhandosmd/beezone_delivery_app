import 'dart:async';

import 'package:beezone_delivery/widgets/common_widgets/app_colors.dart';
import 'package:beezone_delivery/widgets/common_widgets/floating_button.dart';
import 'package:flutter/material.dart';

import 'otp_logic.dart';

class CodePage extends StatefulWidget {
  const CodePage({Key? key}) : super(key: key);

  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  late Timer _timer;
  int _start = 59;

  void startTimer() {
    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(() {
          if (_start == 0) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        }));
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              child: GestureDetector(
                onTap: ()=>Navigator.of(context).pop(),
                child: Image.asset('assets/images/go_back_icon.png', height: 18,)
              )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('00:${_start<10?'0$_start':_start}', style: const TextStyle(fontSize: 32),),
                const SizedBox(height: 12,),
                const Text('На номер +7(707)123-45-67 был отправлен проверечный код.Пожалуйста, введите его ', textAlign: TextAlign.center,),
                const SizedBox(height: 60,),
                PinEntryTextField(
                  onSubmit: (String value) {
                    if(value=='1111'){
                      Navigator.of(context).pushNamed('/home');
                    }
                  },
                  fields: 4,
                  fieldWidth: 60,
                  cursorColor: AppColors.yellow,
                  fontSize: 36,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: const CustomFloatingButton(
        text: 'Далее',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
