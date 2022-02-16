import 'package:desafio_mobcar/models/car.dart';
import 'package:desafio_mobcar/service/cars_service.dart';
import 'package:flutter/cupertino.dart';

class CarsProvider extends ChangeNotifier {

      CarsProvider({required BuildContext context, listen = true});
      CarService _carService = CarService();

  Future<List<Car>> get _data async =>
      await _carService.findAll();

  Future<List<Car>> getCars() async {
    return _data;
  }

  Future<Car> updateCar(Car car) async {
    final updatedCar = await _carService.update(car);
    notifyListeners();
    return updatedCar;
  }

  Future<Car> create(Car car) async {
    final newCar = await _carService.create(car);
    notifyListeners();
    return newCar;
  }

  Future<bool> delete(Car car) async {
    final deleted = await _carService.delete(car);
    notifyListeners();
    return deleted;
  }
}
