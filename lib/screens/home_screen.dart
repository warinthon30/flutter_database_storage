import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_database/models/Transactions.dart';
import 'package:flutter_database/providers/transaction_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("6135512053"),
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  SystemNavigator.pop();
                })
          ],
        ),
        body: Consumer(
          builder: (context, TransactionProvider provider, Widget child) {
            var count = provider.transactions.length; //นับจำนวนข้อมูล
            if (count <= 0) {
              return Center(
                child: Text(
                  "no data",
                  style: TextStyle(fontSize: 35),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: count,
                  itemBuilder: (context, int index) {
                    Transactions data = provider.transactions[index];
                    return Card(
                      elevation: 8,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.purple[50],
                            radius: 30,
                            child: FittedBox(
                              child: Text(data.amount.toString()),
                            ),
                          ),
                          title: Text(
                              "${data.title} ${data.lastname}\n ${data.address}\n ${data.amount}\n ${data.email}\n ${data.password}")),
                    );
                  });
            }
          },
        ));
  }
}
