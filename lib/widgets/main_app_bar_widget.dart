import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import 'icon_font_widget.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {

  final Color themeColor;
  final bool showAvatar;

  MainAppBar({
    this.themeColor = AppColors.GREEN,
    this.showAvatar = true,
  });

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(80.0);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: IconFont(
        iconName: IconFontHelper.LOGO,
        color: widget.themeColor,
        size: 40.0,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: widget.themeColor,
      ),
      actions: [
        Opacity(
          opacity: widget.showAvatar ? 1 : 0,
          child: Container(
            margin: EdgeInsets.only(right: 10.0),
            padding: EdgeInsets.all(10.0),
            child: ClipOval(
              child: Image.asset('assets/images/me.png'),
            ),
          ),
        ),
      ],
    );
  }
}
