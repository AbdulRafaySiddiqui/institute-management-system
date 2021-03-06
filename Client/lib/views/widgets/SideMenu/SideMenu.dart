import 'package:Client/routing/Routes.dart';
import 'package:Client/models/app/SideMenuModel.dart';
import 'package:Client/views/widgets/SideMenu/SideMenuItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> with TickerProviderStateMixin {
  bool isCollapsed = false;
  Duration animationDuration = Duration(milliseconds: 400);
  AnimationController _iconAnimation;
  AnimationController _fadeAnimationController;
  Animation _fadeAnimation;
  AnimationController _alignAnimationController;
  Animation _alignAnimation;
  Animation _slideAnimation;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _iconAnimation =
        AnimationController(vsync: this, duration: animationDuration);

    _fadeAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _fadeAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _fadeAnimationController, curve: Curves.easeOut));

    _alignAnimationController =
        AnimationController(vsync: this, duration: animationDuration);
    _alignAnimation = Tween(begin: Alignment.centerRight, end: Alignment.center)
        .animate(_alignAnimationController);

    _slideAnimation = Tween(begin: Offset.zero, end: Offset(1.0, 0.0))
        .animate(_alignAnimationController);

    _fadeAnimationController.reverse();
    _alignAnimationController.reverse();
  }

  @override
  void dispose() {
    _iconAnimation.dispose();
    _fadeAnimationController.dispose();
    _alignAnimationController.dispose();
    super.dispose();
  }

  void toggleSideMenu() {
    setState(() {
      isCollapsed = !isCollapsed;
      if (isCollapsed) {
        _iconAnimation.forward();
        _fadeAnimationController.forward();
        _alignAnimationController.forward();
      } else {
        _iconAnimation.reverse();
        _fadeAnimationController.reverse();
        _alignAnimationController.reverse();
      }
    });
  }

  void selectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      width: isCollapsed ? 60 : 250,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).accentColor,
            Theme.of(context).primaryColor
          ],
        ),
        boxShadow: [
          BoxShadow(color: Colors.purple, blurRadius: 16),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Menu Button
          AlignTransition(
            alignment: _alignAnimation,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => toggleSideMenu(),
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: AnimatedIcon(
                      color: Colors.white,
                      icon: AnimatedIcons.arrow_menu,
                      progress: _iconAnimation),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          //User Profile Pic
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://widgetwhats.com/app/uploads/2019/11/free-profile-photo-whatsapp-4.png"),
              ),
              SizedBox(height: 20),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  "John Doe",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
              SideMenuItemModel("Branch", Icons.home, Routes.branchRoute),
              SideMenuItemModel(
                  "Class", Icons.supervised_user_circle, Routes.classRoute),
              SideMenuItemModel(
                  "Batch", Icons.admin_panel_settings, Routes.batchRoute),
              SideMenuItemModel("Course", Icons.ac_unit, Routes.courseRoute),
              SideMenuItemModel(
                  "Fee Type", Icons.add_road_rounded, Routes.feeTypeRoute),
              SideMenuItemModel("Batch Fee Type", Icons.add_road_rounded,
                  Routes.batchFeeTypeRoute),
              SideMenuItemModel(
                  "Custom Field", Icons.add_road_rounded, Routes.fieldRoute),
              SideMenuItemModel("Student ID Type", Icons.add_road_rounded,
                  Routes.studentIdTypeRoute),
              SideMenuItemModel(
                  "Student Groups", Icons.add_road_rounded, Routes.groupRoute),
              SideMenuItemModel("Add Student", Icons.add_road_rounded,
                  Routes.studentFormRoute),
              SideMenuItemModel("Guardian Type", Icons.add_road_rounded,
                  Routes.guardianTypeRoute),
              SideMenuItemModel("Student List", Icons.add_road_rounded,
                  Routes.studentsListRoute)
            ].asMap().entries.map((e) {
              return SideMenuItem(
                title: e.value.title,
                icon: e.value.icon,
                isCollapsed: isCollapsed,
                isSelected: e.key == selectedIndex,
                index: e.key,
                duration: animationDuration,
                selectItem: selectItem,
                fadeAnimation: _fadeAnimation,
                slideAnimation: _slideAnimation,
                pageRoute: e.value.pageRoute,
              );
            }).toList()),
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }
}
