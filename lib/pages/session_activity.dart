import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_isar/pages/session_en_cours.dart';

class SessionActivity extends StatefulWidget {
  SessionActivity({ Key? key}) : super(key: key);

  @override
  _SessionActivityState createState() => _SessionActivityState();
}

class _SessionActivityState extends State<SessionActivity> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Row(children: const [
                  Text("Exemple"),
                  SizedBox(width: 50),
                  SizedBox(
                      width: 600,
                      child: TabBar(tabs: [
                        Tab(text: "Sessions")
                      ])),
                  Expanded(child: SizedBox()),
                ])),
            actions: [
              PopupMenuButton(
                  tooltip: "Menu",
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                          child: Text("Does nothing"),
                          onTap: () {
                            
                          })
                    ];
                  },
                  child: Row(
                    children: [
                      Icon(Icons.lock, color: Colors.white),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ))
            ],
          ),
          body: TabBarView(children: [
            SessionEnCours(),
          ])),
    );
  }
}
