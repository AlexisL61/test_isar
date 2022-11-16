import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_isar/model/session.dart';

class SessionWidget extends StatefulWidget {
  SessionWidget({Key? key, required this.session}) : super(key: key);

  Session session;

  @override
  _SessionWidgetState createState() => _SessionWidgetState();
}

class _SessionWidgetState extends State<SessionWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){print("clicked");},
      child:
      Container(
        height: 110,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Row(children: [
                  const Icon(Icons.edit, size: 50),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            widget.session.sessionTitleToString(),
                            style: Theme.of(context).textTheme.labelMedium),
                        Text("${widget.session.candidates.length } candidats",
                            style: const TextStyle(fontSize: 20))
                      ]),
                  const Expanded(child: SizedBox()),
                  Text(widget.session.durationToString(),
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
						Divider(height: 3)
          ],
        )));
  }
}
