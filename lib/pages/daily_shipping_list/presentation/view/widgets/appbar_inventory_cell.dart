import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/presentation/view/widgets/search_view.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/appbar_cell.dart';
import 'package:fusion_warehouses/widgets/custom_bottom_sheet.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/date_picker_fn.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class AppBarainventoryItem extends StatelessWidget
    implements PreferredSizeWidget {
  AppBarainventoryItem({Key? key, this.height,this.action,this.name,this.tabname}) : super(key: key);
  String? name;
  double? height;
  List<Widget>?action;
 String? tabname;
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return AppBarItem(
      action: [
        InkWell(
            onTap: () {
              customBottomSheet(
                  bottomSheetBody: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 32),
                      child: SearchView()));
            },
            child: AppSVGAssets.getWidget(AppSVGAssets.search)),
        InkWell(
            onTap: () async{
              dateTime =await showDatePickerFN(context,dateTime);
              print(dateTime.toString());
            },
            child: AppSVGAssets.getWidget(AppSVGAssets.date,
                width: 60, height: 60)),
      ],
      leading: Transform(
        alignment: Alignment.center,
        transform: AuthService.to.language == 'ar'
            ? Matrix4.rotationY(0)
            : Matrix4.rotationY(math.pi),
        child: InkWell(
          child: AppSVGAssets.getWidget(AppSVGAssets.back),
          onTap: () {
            Get.back();
          },
        ),
      ),
      title: CustomText(name!,
          textStyle: TextStyles.textMedium.copyWith(
              fontSize: 20.sp,

              fontWeight: FontWeight.w500,
              color: const Color(ColorCode.semiBlack))),
      bottom: TabBar(indicatorColor: const Color(ColorCode.yellow), tabs: [
        Tab(
          child: CustomText(AppStrings.current,
              textStyle: TextStyles.textMedium.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
        ),
        Tab(
          child: CustomText(tabname!,
              textStyle: TextStyles.textMedium.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
        ),
      ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);
}
