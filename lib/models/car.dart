import 'dart:convert';

class Car {
  num? id;
  String? fabricante;
  String? modelo;
  String? ano;
  String? valorFipe;
  double? rate;
  Car({
    this.id,
    this.fabricante,
    this.modelo,
    this.ano,
    this.valorFipe,
    this.rate = 4.5,
  });

  Car copyWith({
    num? id,
    String? fabricante,
    String? modelo,
    String? ano,
    String? valorFipe,
    double? rate,
  }) {
    return Car(
        id: id ?? this.id,
        fabricante: fabricante ?? this.fabricante,
        modelo: modelo ?? this.modelo,
        ano: ano ?? this.ano,
        valorFipe: valorFipe ?? this.valorFipe,
        rate: rate ?? 4.5);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fabricante': fabricante,
      'modelo': modelo,
      'ano': ano,
      'valorFipe': valorFipe,
      'rate': rate,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'],
      fabricante: map['fabricante'],
      modelo: map['modelo'],
      ano: map['ano'],
      valorFipe: map['valorFipe'],
      rate: map['rate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Car(id: $id, fabricante: $fabricante, modelo: $modelo, ano: $ano, valorFipe: $valorFipe, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Car &&
        other.id == id &&
        other.fabricante == fabricante &&
        other.modelo == modelo &&
        other.ano == ano &&
        other.valorFipe == valorFipe &&
        other.rate == rate;
  }

  @override
  int get hashCode {
    return id.hashCode ^ fabricante.hashCode ^ modelo.hashCode ^ ano.hashCode ^ valorFipe.hashCode ^ rate.hashCode;
  }
}
