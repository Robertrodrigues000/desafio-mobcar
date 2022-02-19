import 'package:desafio_mobcar/models/car.dart';
import 'package:desafio_mobcar/screens/drawer_page.dart';
import 'package:desafio_mobcar/utils/actions_utils.dart';
import 'package:desafio_mobcar/utils/navigation_helper.dart';
import 'package:desafio_mobcar/widgets/button.dart';
import 'package:desafio_mobcar/widgets/cars_list.dart';
import 'package:desafio_mobcar/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with NavigationHelper {
  final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        appBar: AppBar(),
        isDrawer: false,
        function: () =>
            Navigator.pushAndRemoveUntil(context, createRoute(DrawerPage(key: widget.key)), (route) => true),
      ),
      drawer: Drawer(
        child: Text("data"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
                      child: Text(
                        'Olá, Cliente',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Veículos cadastrados',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Button(
                            text: 'Adicionar',
                            onTap: () {
                              ActionsUtils.showCarFormDialog(context, car: Car(), key: widget.key);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: const Divider(color: Colors.black, height: 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(child: CarsListPage(key: widget.key)),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.black,
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
    );
  }
}
