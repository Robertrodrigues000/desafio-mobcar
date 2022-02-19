import 'package:desafio_mobcar/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final VoidCallback function;
  const CustomAppBar({Key? key, required this.appBar, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: Column(
        children: [
          Icon(MaterialCommunityIcons.steering, color: AppColors.infoBlue),
          Text("MOBCAR", style: TextStyle(color: AppColors.infoBlue)),
        ],
      ),
      automaticallyImplyLeading: false,
      leadingWidth: 100,
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(AntDesign.menu_unfold, color: AppColors.infoBlue),
            onPressed: function,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
