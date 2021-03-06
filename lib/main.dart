import 'package:desafio_mobcar/providers/brands_provider.dart';
import 'package:desafio_mobcar/providers/cars_provider.dart';
import 'package:desafio_mobcar/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarsProvider()),
        ChangeNotifierProvider(create: (_) => BrandsModelsProvider()),
      ],
      child: MaterialApp(
        title: 'MobCar',
        theme: ThemeData(),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
