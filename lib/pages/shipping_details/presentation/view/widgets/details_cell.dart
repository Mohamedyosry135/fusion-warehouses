import 'package:flutter/material.dart';

import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';

import 'package:fusion_warehouses/widgets/custom_text.dart';

class DetailsItem extends StatelessWidget {
  DetailsItem({Key? key, this.widget, required this.listDetails})
      : super(key: key);
  Widget? widget;
  List<Map<String,String>> listDetails;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, bottom: 16, end: 16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
color: Color(ColorCode.white)
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(widget !=null)
                  widget! ,
              if(widget !=null)
                const SizedBox(
                  height: 10,
                ),

              Column(
                children: listDetails.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(e['title'] ??"",
                          textStyle: TextStyles.textMedium.copyWith(
                            fontSize: 13,
                            color: Color(ColorCode.semiBlack),
                            fontWeight: FontWeight.w400,
                          )),
                      CustomText(e['value'] ??"",
                          textStyle: TextStyles.textMedium.copyWith(
                            fontSize: 12,
                            color: Color(ColorCode.secondryGray),
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                )).toList(),
              )
              // ListView.separated(

            ]),
      ),
    );
  }
}
