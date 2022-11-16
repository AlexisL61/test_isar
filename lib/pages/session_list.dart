import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_isar/model/session.dart';
import 'package:test_isar/pages/session.dart';

/// Créé une liste de session ayant comme titre [title] et comme liste de sessions [originalSessions]
/// 
/// La recherche se fait pour l'instant sur le nombre de candidat pour test.
class SessionList extends StatefulWidget {
  const SessionList({required this.title,required this.originalSessions, Key? key}) : super(key: key);
  final String title;
  final List<Session> originalSessions;

  @override
  _SessionListState createState() => _SessionListState();
}

class _SessionListState extends State<SessionList> {
  List<Session> searchSessions = [];

  @override
  void initState() {
    super.initState();
    searchSessions = widget.originalSessions;
  }

  void filterSessions(String term) {
    if (term.trim() != "") {
      searchSessions = widget.originalSessions
          .where((element) => element.candidates.length.toString().contains(term))
          .toList();
      setState(() {});
    } else {
      searchSessions = widget.originalSessions;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.title,
            style: Theme.of(context).textTheme.labelMedium),
        Expanded(
            child: ListView(
                children: List.generate(searchSessions.length,
                    (index) => SessionWidget(session: searchSessions[index]))))
      ]),
    );
  }
}

//List.generate(
      // 50,
      // (index) => Session(
      //     date: DateTime.now().add(Duration(days: index)),
      //     typeSession: "TEF",
      //     nombreCandidats: index));