import 'package:desafio_mobcar/constants/constants.dart';
import 'package:desafio_mobcar/models/car.dart';
import 'package:desafio_mobcar/screens/hero_image_page.dart';
import 'package:desafio_mobcar/utils/actions_utils.dart';
import 'package:desafio_mobcar/widgets/popup_menu_button.dart';
import 'package:flutter/material.dart';

class CarTile extends StatefulWidget {
  final Car car;
  final dynamic parentKey;
  CarTile({Key? key, required this.car, this.parentKey}) : super(key: key);

  @override
  State<CarTile> createState() => _CarTileState();
}

class _CarTileState extends State<CarTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HeroImagePage(
                title: widget.car.modelo ?? "",
                child: Image.asset(GeneralConstants.carImage),
                tag: widget.car.id ?? 0,
              ),
            ),
          );
        },
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              GeneralConstants.carImage,
              width: 44,
              height: 44,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        widget.car.modelo ?? "",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: PopUpMenuButton(widget.car),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          Text(
            widget.car.ano.toString(),
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 4),
          InkWell(
            child: const Text('Ver Mais', style: TextStyle(color: Colors.blue, fontSize: 14)),
            onTap: () {
              ActionsUtils.showCarDetailsDialog(context, widget.car, widget.parentKey);
            },
          ),
        ],
      ),
    );
  }
}
