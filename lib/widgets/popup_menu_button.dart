import 'package:desafio_mobcar/models/car.dart';
import 'package:desafio_mobcar/utils/actions_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class PopUpMenuButton extends StatelessWidget {
  final Car car;

  const PopUpMenuButton(this.car, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(MaterialCommunityIcons.dots_vertical),
      onSelected: (value) {
        switch (value) {
          case 1:
            ActionsUtils.showCarDetailsDialog(
              context,
              car,
              key,
            );
            break;
          case 2:
            ActionsUtils.showCarFormDialog(
              context,
              car: car,
              isInsertMode: false,
              key: key,
            );
            break;
          case 3:
            ActionsUtils.showDeleteCarConfirmationDialog(
              context,
              car,
              key,
            );
            break;
        }
      },
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
            child: Text('Detalhes'),
            value: 1,
          ),
          PopupMenuItem(
            child: Text('Editar'),
            value: 2,
          ),
          PopupMenuItem(
            child: Text('Deletar'),
            value: 3,
          ),
        ];
      },
    );
  }
}
