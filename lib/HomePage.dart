import 'dart:convert';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_fnb/Food.dart';
import 'package:flutter_fnb/FoodAndDrinks.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<FoodList> foodList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);

  }

  Future<List<FoodList>> getData() async {
    String link;
    link = "http://www.mocky.io/v2/5b700cff2e00005c009365cf";

    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    print(res.body);
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        var rest = data["FoodList"] as List;
        foodList = rest.map((i) => FoodList.fromJson(i)).toList();
      print(foodList);
      }
    });
    print("List Size: ${foodList.length}");
    return foodList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("F&B"),
          centerTitle: true,
          actions: <Widget>[
            Text(
              "SKIP",
              style: TextStyle(fontSize: 25),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(text: "Food"),
              new Tab(text: "Drinks"),
            ],
          )),
      body: TabBarView(
          controller: _tabController, children: <Widget>[Food(), Food()]),
    );
  }
}
