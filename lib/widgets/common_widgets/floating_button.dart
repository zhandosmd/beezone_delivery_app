import 'package:beezone_delivery/widgets/common_widgets/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final String text;
  final Color? color;
  final void Function()? onTap;
  const CustomFloatingButton({Key? key, required this.text, this.color, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: color ?? AppColors.yellow,
          ),
          child: Center(child: Text(text, style: const TextStyle(fontSize: 16, fontFamily: 'GoogleSans'))),
        ),
      ),
    );
  }
}
