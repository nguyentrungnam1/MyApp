import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

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
  int _counter = 0;
  static final LocalAuthentication auth = LocalAuthentication();
  bool isDevicesSupport = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    auth.isDeviceSupported().then((value) => setState(
          () => isDevicesSupport = value,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isDevicesSupport
                ? Text("Divices is support Biometric")
                : Text("Divices is not support Biometric"),
            ElevatedButton(
                onPressed: getAuthentication,
                child: Text("Get authentication")),
            ElevatedButton(
                onPressed: () async {
                  bool au = await authentication();
                  if (au) {
                    print("====da check xong===");
                  } else {
                    print("===check fail===");
                  }
                },
                child: Text("authentication"))
          ],
        ),
      ),
    );
  }

  Future<bool> authentication() async {
    return await auth.authenticate(
      localizedReason: "Mở khoá bằng vân tay hoặc face id",
    );
  }

  Future<void> getAuthentication() async {
    List<BiometricType> listBiometric = await auth.getAvailableBiometrics();
    print("-----listBiometric: ${listBiometric}");
  }
}
