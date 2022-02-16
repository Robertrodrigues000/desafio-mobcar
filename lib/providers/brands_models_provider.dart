import 'package:desafio_mobcar/models/brand.dart';
import 'package:desafio_mobcar/models/car_price.dart';
import 'package:desafio_mobcar/models/car_year.dart';
import 'package:desafio_mobcar/models/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BrandsModelsProvider extends ChangeNotifier {
  Dio _dio = Dio();
  var _brands = <Brand>[];
  List<Brand> get brands => _brands;

  Future<List<Brand>> getBrands() async {
    final response = await _dio.get(
      'https://parallelum.com.br/fipe/api/v1/carros/marcas',
    );
    final brands = (response.data as List).map((row) => Brand.fromMap(row)).toList();

    _brands = brands;
    notifyListeners();

    return brands;
  }

  var _models = <Model>[];
  List<Model> get models => _models;

  Future<List<Model>> getModelsByIdBrand({@required codigoMarca}) async {
    final response = await _dio.get(
      'https://parallelum.com.br/fipe/api/v1/carros/marcas/$codigoMarca/modelos',
    );

    final mapData = response.data['modelos'];

    final models = Future.value(
      (mapData as List).map((map) => Model.fromMap(map)).toList(),
    );
    _models = models as List<Model>;
    notifyListeners();
    return models;
  }

  var _carYear = <CarYear>[];

  List<CarYear> get carYear => _carYear;
  Future<List<CarYear>> getCarYears({
    required num idBrand,
    required num idModel,
  }) async {
    final response = await _dio.get(
      'https://parallelum.com.br/fipe/api/v1/carros/marcas/$idBrand/modelos/$idModel/anos',
    );
    final result = (response.data as List).map((map) => CarYear.fromMap(map)).toList();
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
     final response = await _dio.get(
        'https://parallelum.com.br/fipe/api/v1/carros/marcas/$idBrand/modelos/$idModel/anos/$carYear');
    final carPrice = CarPrice.fromMap(response.data);
    _carPrice = carPrice;
    return carPrice;
  }
}
