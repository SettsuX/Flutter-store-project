import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dark.dart';
import 'coffee.dart';
import 'count.dart';

enum Selected { Bread, Donut }

class Cake extends StatefulWidget {
  const Cake({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Cake> createState() => _CakeState();
}

class _CakeState extends State<Cake> {
  Selected? _item1 = Selected.Bread;
  int _counter_in_page = 0;

  @override
  Widget build(BuildContext context) {
    final _myCo = Provider.of<Count>(context, listen: true);
    final _myitem1 = Provider.of<Count>(context, listen: true);
    Selected? _item = Selected.Bread;
    return Scaffold(
      appBar: AppBar(
        title: Text("MENU 2"),
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
              title: const Text('Bread 20 Bath'),
              leading: Radio<Selected>(
                value: Selected.Bread,
                groupValue: _item1,
                onChanged: (Selected? value) {
                  setState(() {
                    _item1 = value;
                    _myitem1.change();
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Dount 10 Bath'),
              leading: Radio<Selected>(
                value: Selected.Donut,
                groupValue: _item1,
                onChanged: (Selected? value) {
                  setState(() {
                    _item1 = value;
                    _myitem1.change1();
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _myCo.del();
                    },
                    child: Icon(Icons.exposure_minus_1)),
                SizedBox(
                  width: 100,
                  child: Consumer(
                      builder: (context, value, child) => Text(
                            '${_myCo.values}',
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          )),
                ),
                ElevatedButton(
                  onPressed: () {
                    _myCo.plas();
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
                        builder: (context) => const SettingsScreen()),
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
