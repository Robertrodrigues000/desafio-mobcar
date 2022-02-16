import 'package:desafio_mobcar/constants/constants.dart';
import 'package:desafio_mobcar/models/car.dart';
import 'package:desafio_mobcar/providers/cars_provider.dart';
import 'package:desafio_mobcar/screens/hero_image_page.dart';
import 'package:desafio_mobcar/utils/actions_utils.dart';
import 'package:desafio_mobcar/widgets/popup_menu_button.dart';
import 'package:flutter/material.dart';

class CarsListPage extends StatelessWidget {
  const CarsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Car>>(
      future: CarsProvider(context: context).getCars(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'Nenhum carro cadastrado...',
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        dynamic car = snapshot.data;
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
             return Column(
      children: [
        ListTile(
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroImagePage(
                    title: car.modelo,
                    child: Image.asset(GeneralConstants.carImage),
                    tag: car.id,
                  ),
                ),
              );
            },
            child: Hero(child: Image.asset(GeneralConstants.carImage), tag: car.id),
          ),
          title: Text(
            car.modelo ?? "",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: PopUpMenuButton(car, key: key),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 4),
              Text(
                car.ano.toString(),
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 4),
              InkWell(
                child: const Text('Ver Mais',
                    style: TextStyle(color: Colors.blue, fontSize: 14)),
                onTap: () {
                  ActionsUtils.showCarDetailsDialog(context, car, key!);
                },
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 12 , right: 12),
          child: const Divider(color: Colors.black),
        )
      ],
    );
          },
        );
      },
    );
  }
}
