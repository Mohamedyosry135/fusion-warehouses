import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/widgets/custom_bottom_sheet.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/custom_text_field_container.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';

class CustomTextBottomsheetWidget extends StatelessWidget {
  final String cellValue;
  final String cellTitle;
  final Widget cellWidget;
  const CustomTextBottomsheetWidget({Key? key,required this.cellValue,required this.cellTitle,required this.cellWidget}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFieldContainer(
          CustomTextFormField(
            onSave: (text) {},
            hint: cellValue,
            inputType: TextInputType.text,
            label: cellValue,
            enable: true,
            suffixIcon: AppSVGAssets.getWidget(AppSVGAssets.downArrow),
            onTap: (){
              customBottomSheet(
                  backgroundColor: ColorCode.white,

                  bottomSheetBody: cellWidget
              );
            },
          ),
        ),


      ],
    );
  }
}
