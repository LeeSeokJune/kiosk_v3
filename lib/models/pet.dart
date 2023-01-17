import 'package:kiosk_v3/components/basic_function.dart';

class Pet {
  int? pet;
  String? name;
  String? breed;
  String? birth_year;
  String? birth_month;
  String? birth_day;
  int? sex;
  int? neutering;
  String? weight;
  int? bcs;
  List alg = [];
  List alg_sub = [];
  List health = [];
  int? age;

  Pet({
    this.pet,
    this.name,
    this.breed,
    this.birth_year,
    this.birth_month,
    this.birth_day,
    this.sex,
    this.neutering,
    this.weight,
    this.bcs,
    this.alg = const [],
    this.alg_sub = const [],
    this.health = const [],
    this.age,
  });

  Pet.fromJson(Map<String, dynamic> json) {
    pet = int.parse(json['pet']);
    birth_year = json['birth_year'];
    birth_month = json['birth_month'];
    birth_day = json['birth_day'];
    sex = int.parse(json['sex']);
    neutering = int.parse(json['neutering']);
    weight = json['weight'];
    bcs = int.parse(json['bcs']);
    alg = str_to_list(json['alg']);
    alg_sub = str_to_list(json['alg_sub']);
    health = str_to_list(json['health']);
    age = json['age'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pet'] = this.pet;
    data['birth_year'] = this.birth_year;
    data['birth_month'] = this.birth_month;
    data['birth_day'] = this.birth_day;
    data['sex'] = this.sex;
    data['neutering'] = this.neutering;
    data['weight'] = this.weight;
    data['bcs'] = this.bcs;
    data['alg'] = this.alg;
    data['alg_sub'] = this.alg_sub;
    data['health'] = this.health;
    data['age'] = this.age;
    return data;
  }
}
