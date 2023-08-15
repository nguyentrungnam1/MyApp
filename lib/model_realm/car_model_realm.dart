import 'package:realm/realm.dart';
part 'car_model_realm.g.dart';

@RealmModel()
class _Car {
  late String make;
  late String model;
  int? km = 500;
}
