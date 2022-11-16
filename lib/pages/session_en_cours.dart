import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:test_isar/model/session.dart';
import 'package:test_isar/pages/session_list.dart';

class SessionEnCours extends StatefulWidget {
  SessionEnCours({Key? key}) : super(key: key);

  @override
  _SessionEnCoursState createState() => _SessionEnCoursState();
}

class _SessionEnCoursState extends State<SessionEnCours> {
  late Isar isar;
  bool isarLoaded = false;
  late List<Session> originalSessions = List.generate(
      5,
      (index) => Session.generateTestSession(
        index.toString(),
        "Test",
         DateTime.now().add(Duration(days: index))));
  
  @override
  void initState() {
    loadIsar();
    super.initState();
  }

  void loadIsar()async{
    isar = await Isar.open([SessionSchema]);
    isarLoaded = true;
    isar.writeTxn(() async {
      await isar.sessions.putAll(originalSessions);
    });
    List<Session> sessions = await isar.sessions.where().findAll();
    originalSessions = sessions;
    print(originalSessions.length);

    sessions.forEach((element) {
      print(element.sessionTitleToString());
    });

    setState((){});
  }

  

  @override
  Widget build(BuildContext context) {
    return isarLoaded?SessionList(title: "Sessions à venir", originalSessions: originalSessions):Container();
  }
}
