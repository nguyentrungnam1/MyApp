import 'package:flutter/material.dart';
import 'package:my_app/model_realm/car_model_realm.dart';
import 'package:realm/realm.dart';

class CarDetail extends StatefulWidget {
  const CarDetail({super.key, required this.car, required this.realm});
  final Car car;
  final Realm realm;

  @override
  State<CarDetail> createState() => _CarDetailState();
}

class _CarDetailState extends State<CarDetail> {
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController kmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Car")),
      body: Column(
        children: [
          TextFormField(controller: makeController),
          TextFormField(
            controller: modelController,
          ),
          TextFormField(
            controller: kmController,
          ),
          Text(widget.car.make),
          Text(widget.car.model),
          TextButton(
              onPressed: () async {
                // RealmResults<Car> test = widget.realm.all<Car>();// gọi giá trị Car trong realm
                widget.realm.write(() {
                  widget.car.make = makeController.text;
                  widget.car.model = modelController.text;
                  widget.car.km = 2;
                  widget.realm.add<Car>(widget.car, update: true);
                });
                Navigator.pop(context);
              },
              child: Text("edit"))
        ],
      ),
    );
  }
}
