import 'package:flutter/material.dart';
import 'package:my_app/model_realm/car_model_realm.dart';
import 'package:my_app/screen/car_detail.dart';
import 'package:realm/realm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Realm realm;
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();

  TextEditingController kmController = TextEditingController();

  void _incrementCounter() {
    setState(() {});
    realm.write(() {
      realm.add(Car(makeController.text, modelController.text,
          km: int.parse(kmController.text)));
    });
  }

  _MyHomePageState() {
    final config = Configuration.local([Car.schema]);
    realm = Realm(config);
  }

  @override
  void initState() {
    var test = realm.all<Car>();
    print("test: ${test.length}");

    super.initState();
  }

  int get carsCount => realm.all<Car>().length;

  @override
  Widget build(BuildContext context) {
    RealmResults<Car> listCar = realm.all<Car>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: makeController,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: modelController,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: kmController,
          ),
          ListView.builder(
            shrinkWrap: true,
            // physics: ScrollPhysics(),
            itemCount: carsCount,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CarDetail(car: listCar[index], realm: realm),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          listCar[index].make,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        subtitle: Text(
                          listCar[index].model,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              setState(() {});
                              realm.write(() {
                                realm.delete(listCar[index]);
                              });
                            },
                            child: Icon(Icons.close)))
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
