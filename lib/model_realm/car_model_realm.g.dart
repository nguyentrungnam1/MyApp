// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model_realm.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Car extends _Car with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Car(
    String make,
    String model, {
    int? km = 500,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Car>({
        'km': 500,
      });
    }
    RealmObjectBase.set(this, 'make', make);
    RealmObjectBase.set(this, 'model', model);
    RealmObjectBase.set(this, 'km', km);
  }

  Car._();

  @override
  String get make => RealmObjectBase.get<String>(this, 'make') as String;
  @override
  set make(String value) => RealmObjectBase.set(this, 'make', value);

  @override
  String get model => RealmObjectBase.get<String>(this, 'model') as String;
  @override
  set model(String value) => RealmObjectBase.set(this, 'model', value);

  @override
  int? get km => RealmObjectBase.get<int>(this, 'km') as int?;
  @override
  set km(int? value) => RealmObjectBase.set(this, 'km', value);

  @override
  Stream<RealmObjectChanges<Car>> get changes =>
      RealmObjectBase.getChanges<Car>(this);

  @override
  Car freeze() => RealmObjectBase.freezeObject<Car>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Car._);
    return const SchemaObject(ObjectType.realmObject, Car, 'Car', [
      SchemaProperty('make', RealmPropertyType.string),
      SchemaProperty('model', RealmPropertyType.string),
      SchemaProperty('km', RealmPropertyType.int, optional: true),
    ]);
  }
}
