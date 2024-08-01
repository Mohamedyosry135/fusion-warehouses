import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';

class CardHome extends StatelessWidget {
  const CardHome({Key? key, required this.color, required this.title, required this.icon, required this.onTap}) : super(key: key);

  final Color color;
  final String title;
  final Widget icon;
  final Function() onTap;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Align(
                alignment: AuthService.to.language =="ar"? Alignment.centerLeft : Alignment.centerRight,
                  child: icon),
              const SizedBox(height: 24,),
              CustomText(
                  title,
                textStyle: TextStyles.textMedium.copyWith(
                  color: const Color(ColorCode.white),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
