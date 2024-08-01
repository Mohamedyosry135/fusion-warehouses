import 'package:flutter/material.dart';

import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class AppBarItem extends StatelessWidget implements PreferredSizeWidget {
  AppBarItem({Key? key, this.height = 60,this.title,this.leading,this.action,this.bottom}) : super(key: key);
  double? height;
  Widget ?leading;
  Widget ?title;
  List<Widget> ?action;
  PreferredSizeWidget ?bottom;




  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(ColorCode.white),
      actions: action,
      elevation: 0,
      leading: leading,
      title: title,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);
}
