import 'package:desafio_mobcar/constants/colors.dart';
import 'package:desafio_mobcar/models/car.dart';
import 'package:desafio_mobcar/widgets/button.dart';
import 'package:desafio_mobcar/widgets/car_form_widget.dart';
import 'package:desafio_mobcar/widgets/details_car_dialog.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _scaffoldKey = new GlobalKey();
  List carList = ["FIAT", "Uno"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.ac_unit_sharp, color: AppColors.infoBlue),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(AntDesign.menu_unfold, color: AppColors.infoBlue),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Text("data"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned(
                right: 12,
                bottom: 12,
                child: Button(
                            text: 'Adicionar Novo',
                            onTap: () {
                              showCarFormDialog(
                                context,
                                car: Car(),
                              );
                            },
                          ),
              ),
              ListTile(
                title: Text("teste"),
                subtitle: Text("subtitle"),
              ),
            ],
          ),
          Divider(
            endIndent: 12,
            indent: 12,
            color: Colors.black,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                if (index < carList.length)
                  return ListTile(
                    title: Text(carList[index]),
                    subtitle: Text("subtitle"),
                    trailing: Icon(
                      MaterialCommunityIcons.dots_vertical,
                      color: Colors.black,
                    ),
                  );
                else
                  return SizedBox(height: 110);
              },
              itemCount: carList.length + 1,
              separatorBuilder: (context, index) {
                return Divider(
                  endIndent: 12,
                  indent: 12,
                  color: Colors.black,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "2020 All rights reserved to Mobcar",
            style: TextStyle(color: AppColors.infoBlue),
          ),
        ),
      ),
    );
  }

  void showCarFormDialog(
    BuildContext context, {
    required Car car,
    bool isInsertMode = true,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsCarDialogWidget(
          child: CarFormWidget(
            car: car,
            isInsertMode: isInsertMode,
          ),
          car: car,
        );
      },
    );
  }
}
