import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/home/presentation/views/home_view.dart';
import 'package:fusion_warehouses/pages/notifications/presentation/views/notifications_view.dart';


import 'package:fusion_warehouses/pages/profile/presentation/views/profile_view.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavigationScreen extends StatefulWidget {
  BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);
  Color selectedColor = Color(ColorCode.blue);
  late final bool _hideNavBar = false;
  late BuildContext testContext;
  List<Widget> pageList = <Widget>[
    HomeView(),
    NotificationsView(),
    ProfileView(),

    //ProfileView()
  ];


  List<Widget> _buildScreens() {
    return [HomeView(),
      NotificationsView(),
      ProfileView(),];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon:AppSVGAssets.getWidget(AppSVGAssets.home,color: Color(ColorCode.blue)),
          inactiveIcon: AppSVGAssets.getWidget(AppSVGAssets.home,color: Color(ColorCode.gray2)),
          title: AppStrings.home,
          activeColorPrimary: const Color(ColorCode.blue),
          inactiveColorPrimary:  Colors.transparent,
          // inactiveColorSecondary: Colors.purple,
          textStyle: TextStyles.textMedium.copyWith(
              color:Color(ColorCode.blue),
              fontSize: 12,
              height: .1,

              fontWeight: FontWeight.w400
          ),
          iconSize: 20,
          contentPadding: 0),
      PersistentBottomNavBarItem(
          icon: AppSVGAssets.getWidget(AppSVGAssets.notification,color: Color(ColorCode.lightBlue)),
          inactiveIcon: AppSVGAssets.getWidget(AppSVGAssets.notification,color: Color(ColorCode.gray2)),
          title: AppStrings.notification,
          activeColorPrimary: const Color(ColorCode.lightBlue),
          inactiveColorPrimary:  Colors.transparent,
          // inactiveColorSecondary: Colors.purple,
          textStyle: TextStyles.textMedium.copyWith(
              color:Color(ColorCode.lightBlue),
              fontSize: 12,
              height: .1,

              fontWeight: FontWeight.w400
          ),
          contentPadding: 0),
      PersistentBottomNavBarItem(
          icon: AppSVGAssets.getWidget(AppSVGAssets.user,color: Color(ColorCode.red)),
          inactiveIcon: AppSVGAssets.getWidget(AppSVGAssets.user,color: Color(ColorCode.gray2)),
          title: AppStrings.profile,
          activeColorPrimary: const Color(ColorCode.red),
          inactiveColorPrimary:  Colors.transparent,
          // inactiveColorSecondary: Colors.purple,
          textStyle: TextStyles.textMedium.copyWith(
              color:Color(ColorCode.red),
              fontSize: 12,
              height: .1,

              fontWeight: FontWeight.w400
          ),
          contentPadding: 0),



    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
     decoration: NavBarDecoration(
         boxShadow: [
           BoxShadow(

               blurRadius: 4,spreadRadius: 0,
               color: Color.fromARGB(12,0, 0, 0 )
           )
         ]
     ),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0 ? 0.0 : 60,
      hideNavigationBarWhenKeyboardShows: true,
      margin: const EdgeInsets.all(0),
      bottomScreenMargin: 0.0,
      selectedTabScreenContext: (context) {
        testContext = context!;
      },
      hideNavigationBar: _hideNavBar,

      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style6, // Choose the nav bar style with this property
    ),

    );


  }


  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}