import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SideMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final bool isCollapsed;
  final Duration duration;
  final int index;
  final Function selectItem;
  final Animation fadeAnimation;
  final Animation slideAnimation;

  const SideMenuItem(
      {Key key,
      this.title,
      this.icon,
      this.isSelected = false,
      this.isCollapsed,
      this.duration,
      this.index,
      this.selectItem,
      this.slideAnimation,
      this.fadeAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {selectItem(index)},
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: 50,
          color: isSelected ? Colors.black12 : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 50,
                  width: 5,
                  decoration: isSelected
                      ? BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xFF9dfad4), Color(0xFF66bbf0)],
                          ),
                          boxShadow: [
                            BoxShadow(color: Color(0xFF9dfad4), blurRadius: 8),
                          ],
                        )
                      : null),
              Container(
                width: 55,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(icon, color: Colors.white),
              ),
              AnimatedContainer(
                duration: duration,
                width: isCollapsed ? 0 : 190,
                child: SlideTransition(
                  position: slideAnimation,
                  child: FadeTransition(
                    opacity: fadeAnimation,
                    child: Text(
                      title,
                      softWrap: false,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
