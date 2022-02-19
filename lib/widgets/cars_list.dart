import 'package:desafio_mobcar/models/car.dart';
import 'package:desafio_mobcar/providers/cars_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'car_tile.dart';

class CarsListPage extends StatelessWidget {
  const CarsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Car>>(
      future: Provider.of<CarsProvider>(context).getCars(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'Nenhum carro cadastrado',
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        dynamic car = snapshot.data;
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
            indent: 12,
            endIndent: 12,
          ),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return CarTile(car: car[index], key: key);
          },
        );
      },
    );
  }
}
