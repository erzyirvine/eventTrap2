import 'package:flutter/material.dart';
import 'package:abp_revisi/component/colors.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,
    required this.text,
    required this.warna,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Color warna;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: warna,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
            text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),

      ),
    );
  }
}
