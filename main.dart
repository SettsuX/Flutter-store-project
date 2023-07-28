import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dark.dart';
import 'coffee.dart';
import 'counter.dart';
import 'cake.dart';
import 'count.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
        ChangeNotifierProvider(create: (context) => Count()),
        ChangeNotifierProvider(create: (context) => SettingsScreenNotifier()),
      ],
      child: Consumer<SettingsScreenNotifier>(
        builder: (context, notifier, child) {
          return MaterialApp(
            title: 'State Example',
            theme: ThemeData(
              primarySwatch: Colors.yellow,
            ),
            darkTheme: ThemeData.dark(),
            themeMode:
                notifier.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
            home: const MyHomePage(title: 'State Example'),
          );
        },
      ),
    );
  }
}

enum Selected {
  Coffee,
  Tea,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Selected? _item = Selected.Coffee;
  int _counter_in_page = 0;

  @override
  Widget build(BuildContext context) {
    final _myCounter = Provider.of<Counter>(context, listen: true);
    final _myitem = Provider.of<Counter>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Select Order",
              style: TextStyle(fontSize: 48, color: Colors.blueGrey),
            ),
            ListTile(
              title: const Text('Coffee 40 Bath'),
              leading: Radio<Selected>(
                value: Selected.Coffee,
                groupValue: _item,
                onChanged: (Selected? value) {
                  setState(() {
                    _item = value;
                    _myitem.change();
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Tea 30 Bath'),
              leading: Radio<Selected>(
                value: Selected.Tea,
                groupValue: _item,
                onChanged: (Selected? value) {
                  setState(() {
                    _item = value;
                    _myitem.change1();
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _myCounter.decrement();
                    },
                    child: Icon(Icons.exposure_minus_1)),
                SizedBox(
                  width: 100,
                  child: Consumer(
                      builder: (context, value, child) => Text(
                            '${_myCounter.value}',
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          )),
                ),
                ElevatedButton(
                  onPressed: () {
                    _myCounter.increment();
                  },
                  child: Icon(Icons.plus_one),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Cake(
                              title: '',
                            )),
                  );
                },
                child: Icon(
                  Icons.forward,
                  color: Colors.white,
                  size: 32,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  onSurface: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: Size(240, 40),
                )),
          ],
        ),
      ),
    );
  }
}
