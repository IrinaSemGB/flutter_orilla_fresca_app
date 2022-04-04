import 'package:flutter/material.dart';
import 'package:orilla_fresca/widgets/user_profile_header.dart';
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
      title: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/categories_page');
        },
        child: IconFont(
          iconName: IconFontHelper.LOGO,
          color: widget.themeColor,
          size: 40.0,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: widget.themeColor,
      ),
      actions: [
        Opacity(
          opacity: widget.showAvatar ? 1 : 0,
          child: UserProfileHeader(
            showProfilePic: widget.showAvatar,
          ),
        ),
      ],
    );
  }
}
