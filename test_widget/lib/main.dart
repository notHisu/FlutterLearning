import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Multiple Checkbox Example"),
          ),
          body: SafeArea(
              child: Center(
            child: CheckboxWidget(),
          ))),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  @override
  CheckboxWidgetState createState() => new CheckboxWidgetState();
}

class CheckboxWidgetState extends State {
  Map<String, bool> values = {
    'google.com': false,
    'youtube.com': false,
    'yahoo.com': false,
    'gmail.com': false,
  };

  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    print(tmpArray);
    tmpArray.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView(
          shrinkWrap: true,
          children: values.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              value: values[key],
              onChanged: (value) {
                setState(() {
                  values[key] = value!;
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 100,
        ),
        ElevatedButton(
          child: Text(
            " Checkbox Items ",
            style: TextStyle(fontSize: 18),
          ),
          onPressed: getCheckboxItems,
        ),
      ],
    );
  }
}
