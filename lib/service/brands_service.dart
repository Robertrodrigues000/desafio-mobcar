import 'package:desafio_mobcar/models/brand.dart';
import 'package:desafio_mobcar/models/car_price.dart';
import 'package:desafio_mobcar/models/car_year.dart';
import 'package:desafio_mobcar/models/model.dart';
import 'package:dio/dio.dart';

class BrandsService {
  Dio _dio = Dio();
  var _brands = <Brand>[];
  List<Brand> get brands => _brands;

  Future<List<Brand>> getBrands() async {
    final response = await _dio.get(
      'https://parallelum.com.br/fipe/api/v1/carros/marcas',
    );
    return (response.data as List).map((row) => Brand.fromMap(row)).toList();
  }
  
  Future<List<Model>> getModelsByIdBrand({required codigoMarca}) async {
    final response = await _dio.get(
      'https://parallelum.com.br/fipe/api/v1/carros/marcas/$codigoMarca/modelos',
    );

    final mapData = response.data['modelos'];

    return Future.value(
      (mapData as List).map((map) => Model.fromMap(map)).toList(),
    );
  }

  Future<List<CarYear>> getCarYears({
    required num idBrand,
    required num idModel,
  }) async {
    final response = await _dio.get(
      'https://parallelum.com.br/fipe/api/v1/carros/marcas/$idBrand/modelos/$idModel/anos',
    );
    final lista =
        (response.data as List).map((map) => CarYear.fromMap(map)).toList();
    return lista;
  }

   Future<CarPrice> getCarPrice({
    required num idBrand,
    required num idModel,
    required dynamic carYear,
  }) async {
    final response = await _dio.get(
        'https://parallelum.com.br/fipe/api/v1/carros/marcas/$idBrand/modelos/$idModel/anos/$carYear');
    return CarPrice.fromMap(response.data);
  }
}