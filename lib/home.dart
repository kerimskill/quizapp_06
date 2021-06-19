import 'package:flutter/material.dart';
import 'suroo2.dart';
import 'widgets2.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//---------------------Varible-----------------------//
  int index = 0;
  String joop = "";
  List<Suroo> suroolor = [
    Suroo(suroo: "Telefon", joop1: "Internet bar", joop2: "Internet jok"),
    Suroo(suroo: "Ekran", joop1: "Sensor", joop2: "Klavye"),
    Suroo(suroo: "Camera", joop1: "Maaniluu", joop2: "Maaniluu emes"),
    Suroo(suroo: "Abal", joop1: "Мошьный", joop2: "Бюджетный"),
    Suroo(suroo: "Batereyka", joop1: "Maaniluu", joop2: "Maaniluu emes"),
  ];
//-----------------------UI------------------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Эмне каалайсын?"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SurooText(suroolor[index].suroo),
            Joop(joop: suroolor[index].joop1, joopBer: atkar),
            Joop(joop: suroolor[index].joop2, joopBer: atkar),
          ],
        ),
      ),
    );
  }

//----------------------------Methods-------------------------//
  atkar(String value) {
    joop = joop + "/$value";
    print(joop);
    setState(() {
      if (index < suroolor.length - 1) {
        index++;
      } else {
        index = 0;
      }
    });
    if (joop == "/Internet bar/Sensor/Maaniluu/Мошьный/Maaniluu emes") {
      _showMyDialog("Iphone 12 pro");
      joop = "";
    } else if (joop == "/Internet bar/Sensor/Maaniluu/Мошьный/Maaniluu") {
      _showMyDialog("Xiomi 12 pro");
      joop = "";
    } else if (joop == "/Internet bar/Sensor/Maaniluu emes/Мошьный/Maaniluu") {
      _showMyDialog("Honor pro");
      joop = "";
    } else if (joop ==
        "/Internet bar/Sensor/Maaniluu emes/Мошьный/Maaniluu emes") {
      _showMyDialog("Samsung a5");
      joop = "";
    } else if (joop == "/Internet bar/Sensor/Maaniluu/Бюджетный/Maaniluu") {
      _showMyDialog("Xiomi note 7");
      joop = "";
    } else if (joop ==
        "/Internet bar/Sensor/Maaniluu emes/Бюджетный/Maaniluu") {
      _showMyDialog("Xiomi 6a");
      joop = "";
    } else if (joop ==
        "/Internet bar/Sensor/Maaniluu/Бюджетный/Maaniluu emes") {
      _showMyDialog("Iphone 5s");
      joop = "";
    } else if (joop ==
        "/Internet bar/Sensor/Maaniluu emes/Бюджетный/Maaniluu emes") {
      _showMyDialog("Samsung j1");
      joop = "";
    } else if (joop == "/Internet bar/Klavye") {
      _showMyDialog("Nokia 6300");
      joop = "";
      setState(() {
        index = 0;
      });
    } else if (joop == "/Internet jok/Sensor") {
      _showMyDialog("Anday telefon bizde jok");
      joop = "";
      setState(() {
        index = 0;
      });
    } else if (joop == "/Internet jok/Klavye") {
      _showMyDialog("Nokia,\nSamsung j1");
      joop = "";
      setState(() {
        index = 0;
      });
    }
  }

  Future<void> _showMyDialog(String joop) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.orange,
          title: Text(joop),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Сиз үчүн биз $joop сунуштай алабыз'),
                Text('Бизге кайрылганыңыз үчүн рахмат'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Oк'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
