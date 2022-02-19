import 'package:desafio_mobcar/screens/menu_2.dart';
import 'package:desafio_mobcar/screens/menu_3.dart';
import 'package:desafio_mobcar/utils/navigation_helper.dart';
import 'package:desafio_mobcar/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> with NavigationHelper {
  var isHomePageSelected = true;
  var isMenu2Selected = false;
  var isMenu3Selected = false;

  List<Widget> get drawerItems => [
        _buildDrawerItem(
          itemTitle: 'Home Page',
          isSelected: isHomePageSelected,
          onTap: () {
            setState(() {
              isHomePageSelected = true;
              isMenu2Selected = false;
              isMenu3Selected = false;
            });
            Navigator.pop(context);
          },
        ),
        _buildDrawerItem(
          itemTitle: 'Menu 2',
          isSelected: isMenu2Selected,
          onTap: () {
            setState(() {
              isMenu2Selected = true;
              isHomePageSelected = false;
              isMenu3Selected = false;
            });
            Navigator.of(context).push(createRoute(const Menu2Page()));
          },
        ),
        _buildDrawerItem(
          itemTitle: 'Menu 3',
          isSelected: isMenu3Selected,
          onTap: () {
            setState(() {
              isMenu3Selected = true;
              isMenu2Selected = false;
              isHomePageSelected = false;
            });
            Navigator.of(context).push(createRoute(const Menu3Page()));
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/blackBackground.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: CustomAppBar(appBar: AppBar(), function: () => Navigator.pop(context), isDrawer: true),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/blackBackground.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.topRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListView.builder(
                    itemCount: drawerItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.centerRight,
                        child: drawerItems[index],
                      );
                    },
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('© ', style: TextStyle(color: Colors.blue, fontSize: 22)),
                        Text(
                          ' 2020. All rights reserved to Mobcar.',
                          style: TextStyle(color: Colors.blue, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDrawerItem({required String itemTitle, required bool isSelected, required void Function() onTap}) {
    final _textStyle = TextStyle(
      color: isSelected ? Colors.blue : Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Text(itemTitle, style: _textStyle),
      ),
    );
  }
}
