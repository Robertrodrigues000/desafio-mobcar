import 'package:desafio_mobcar/models/car.dart';
import 'package:desafio_mobcar/providers/cars_provider.dart';
import 'package:desafio_mobcar/widgets/button.dart';
import 'package:desafio_mobcar/widgets/car_details_dialog_content_widget.dart';
import 'package:desafio_mobcar/widgets/car_form_widget.dart';
import 'package:desafio_mobcar/widgets/details_car_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionsUtils {
  static void showCarDetailsDialog(BuildContext context, Car car, Key key) {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsCarDialogWidget(
          child: CarDetailsDialogContentWidget(car: car),
          car: car,
          key: key,
        );
      },
    );
  }

  static void showCarFormDialog(
    BuildContext context, {
    required Car car,
    bool isInsertMode = true,
    Key? key,
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
          key: key,
        );
      },
    );
  }

  static void showDeleteCarConfirmationDialog(
    BuildContext context,
    Car car,
    Key key,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsCarDialogWidget(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Você deseja excluir o carro ${car.modelo}?',
                  style: const TextStyle(fontSize: 16),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24.0),
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Button(
                        text: 'Cancelar',
                        useBlackButton: false,
                        onTap: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 4),
                      Button(
                        text: 'Confirmar',
                        onTap: () {
                          _ondDeleteCar(context, car);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          car: car,
          key: key,
        );
      },
    );
  }

  static void _ondDeleteCar(BuildContext context, Car car) {
    CarsProvider(context: context, listen: false).delete(car);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${car.modelo} removido com sucesso')),
    );
    Navigator.pop(context);
  }
}
