import 'package:flutter/material.dart';
import 'package:flutter_fnb/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[item(),item()],
      ),
    );
  }

  Widget item() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Image.network(
                "https://cdn.schlotzskys.com/-/media/schlotzskys/menu/sandwiches/smoked-turkey-breast_874x440.jpg?v=1&d=20180104T171725Z",
              ),
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
/*
            new Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0))),
              child: Image.network(
                  "https://cdn.schlotzskys.com/-/media/schlotzskys/menu/sandwiches/smoked-turkey-breast_874x440.jpg?v=1&d=20180104T171725Z",),
            ),
*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  onPressed: null,
                  color: Colors.white,
                  child: Text("Normal"),
                ),
                MaterialButton(
                  color: Colors.yellow,
                  onPressed: null,
                  child: Text("Regular"),
                ),
                MaterialButton(
                  onPressed: null,
                  color: Colors.white,
                  child: Text(
                    "Large",
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "MEXICAN burger with chips",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "AED 15",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "1",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
