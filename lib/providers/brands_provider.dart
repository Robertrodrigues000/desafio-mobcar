import 'package:desafio_mobcar/models/brand.dart';
import 'package:desafio_mobcar/models/car_price.dart';
import 'package:desafio_mobcar/models/car_year.dart';
import 'package:desafio_mobcar/models/model.dart';
import 'package:desafio_mobcar/service/brands_service.dart';
import 'package:flutter/cupertino.dart';

class BrandsModelsProvider extends ChangeNotifier {
  var _brands = <Brand>[];
  List<Brand> get brands => _brands;
  BrandsService _brandsService = BrandsService();

  Future<List<Brand>> getBrands() async {
    _brands= await _brandsService.getBrands();
    notifyListeners();

    return brands;
  }

  var _models = <Model>[];
  List<Model> get models => _models;

  Future<List<Model>> getModelsByIdBrand({@required codigoMarca}) async {
    final models = await _brandsService
        .getModelsByIdBrand(codigoMarca: codigoMarca);
    _models = models;
    notifyListeners();
    return models;
  }

  var _carYear = <CarYear>[];

  List<CarYear> get carYear => _carYear;
  Future<List<CarYear>> getCarYears({
    required num idBrand,
    required num idModel,
  }) async {
    final result = await _brandsService
        .getCarYears(idBrand: idBrand, idModel: idModel);
    _carYear = result;
    notifyListeners();
    return result;
  }

  CarPrice _carPrice = CarPrice(valor: '');
  CarPrice get carPrice => _carPrice;
  Future<CarPrice> getCarPrice({
    required num idBrand,
    required num idModel,
    required String carYear,
  }) async {
    final carPrice = await _brandsService
        .getCarPrice(idBrand: idBrand, idModel: idModel, carYear: carYear);
    _carPrice = carPrice;
    return carPrice;
  }
}
