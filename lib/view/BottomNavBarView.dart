import 'package:comp_306/view/MainView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavBarView> createState() => _BottomNavBarView();
}

class _BottomNavBarView extends State<BottomNavBarView> {
  PersistentTabController? _controller;

  List<Widget> _buildScreens() {
    return [
      MainView(),
      MainView(),
      MainView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Main Page",
        textStyle: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.black26,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_basket),
        title: "Basket ",
        textStyle: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.black26,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: "Profile",
        textStyle: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.black26,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Builder(builder: (BuildContext context) {
            return PersistentTabView(
              context,
              controller: _controller,
              screens: _buildScreens(),
              items: _navBarsItems(),
              confineInSafeArea: true,
              backgroundColor: Colors.white,
              // Default is Colors.white.
              handleAndroidBackButtonPress: true,
              // Default is true.
              resizeToAvoidBottomInset: true,
              // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
              stateManagement: true,
              // Default is true.
              hideNavigationBarWhenKeyboardShows: true,
              // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: ItemAnimationProperties(
                // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: ScreenTransitionAnimation(
                // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              navBarStyle: NavBarStyle.style6,
              onItemSelected: (int index) {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown
                ]);
              },
              // Choose the nav bar style with this property.
            );
          }),
        );
      },
    );
  }
}