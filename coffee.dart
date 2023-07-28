import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';
import 'count.dart';
import 'dark.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _myCounter = Provider.of<Counter>(context, listen: true);
    final _myitem = Provider.of<Counter>(context, listen: true);
    final _myCo = Provider.of<Count>(context, listen: true);
    final _myitem1 = Provider.of<Count>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Total"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Total",
              style: TextStyle(fontSize: 48, color: Colors.blueGrey),
            ),
            SizedBox(
              width: 100,
              child: Consumer(
                  builder: (context, value, child) => Text(
                        '${_myitem.name}\n${_myCounter.value} * ${(_myitem.prize).toString()} ',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      )),
            ),
            SizedBox(
              width: 100,
              child: Consumer(
                  builder: (context, value, child) => Text(
                        '${_myitem1.name}\n${_myCo.values} * ${(_myitem1.prize).toString()}',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      )),
            ),
            SizedBox(
              width: 100,
              child: Consumer(
                  builder: (context, value, child) => Text(
                        ('${(_myCo.values * _myitem1.prize + _myCounter.value * _myitem.prize)}'),
                        style: TextStyle(fontSize: 50),
                        textAlign: TextAlign.center,
                      )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Consumer<SettingsScreenNotifier>(
              builder: (context, notifier, child) {
                return SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: notifier.isDarkModeEnabled,
                  secondary:
                      const Icon(Icons.dark_mode, color: Color(0xFF642ef3)),
                  onChanged: ((value) {
                    notifier.toggleApplicationTheme(value);
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
