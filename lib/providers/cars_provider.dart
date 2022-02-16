import 'package:desafio_mobcar/models/car.dart';
import 'package:desafio_mobcar/service/cars_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CarsProvider extends ChangeNotifier {
  static CarsProvider of(BuildContext context, {listen = true}) =>
      Provider.of<CarsProvider>(context, listen: listen);
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

    Future<Car> findById({required num id}) async {
    return await _carService.findById(id: id);
  }
}
