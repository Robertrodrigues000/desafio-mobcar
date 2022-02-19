import 'package:desafio_mobcar/models/car.dart';
import 'package:desafio_mobcar/service/cars_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CarsServiceMock extends Mock implements CarService {}

void main() {
  CarService? carsService;
  Car? palio, gol, uno;
  List<Car>? cars;
  setUpAll(() {
    carsService = CarsServiceMock();
    palio = Car(
        id: 1,
        modelo: 'Pálio',
        fabricante: 'Fiat',
        ano: '2011',
        valorFipe: '45000');
    gol = Car(
        id: 2,
        modelo: 'Gol',
        fabricante: 'Volkswagen',
        ano: '2011',
        valorFipe: '38900');
    uno = Car(
        id: 3,
        modelo: 'Uno',
        fabricante: 'Fiat',
        ano: '2004',
        valorFipe: '7000');

    cars = [palio!, gol!, uno!];
  });
  group('Testes do CarsRepository =>', () {
    test('Deve ser possível criar um novo carro', () async {
      when(carsService!.create(palio)).thenAnswer((_) async => palio!);
      final createdCar = await carsService!.create(palio!);
      expect(createdCar, isA<Car>());
      expect(createdCar!.modelo, equals('Pálio'));
    });

    test('Deve ser possível atualizar um carro', () async {
      when(carsService!.update(gol!))
          .thenAnswer((_) async => gol!..ano = '2012');
      final updatedCar = await carsService!.update(gol!);

      expect(updatedCar!.ano, equals('2012'));
    });

    test('Deve ser possível deletar um carro', () async {
      when(carsService!.delete(uno!)).thenAnswer((_) async => true);
      final idDeleted = await carsService!.delete(uno!);
      expect(idDeleted, isTrue);
    });
    test('Deve ser possível buscar um carro pelo id', () async {
      when(carsService!.findById(id: palio!.id!))
          .thenAnswer((_) async => palio!);
      final foundCar = await carsService!.findById(id: palio!.id!);
      expect(foundCar!.modelo, equals('Pálio'));
    });
    test('Deve ser possível buscar todos os carros', () async {
      when(carsService!.findAll()).thenAnswer((_) async => cars!);
      final foundCars = await carsService!.findAll();
      expect(foundCars, isA<List>());
      expect(foundCars!.length, equals(3));
    });
  });
}
