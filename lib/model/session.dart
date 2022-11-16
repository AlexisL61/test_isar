import 'package:isar/isar.dart';

import '../utils/datetime_util.dart';
import 'candidat.dart';

part 'session.g.dart';

@collection
class Session {
  Id isarId = Isar.autoIncrement;
  String id;
  String type;
  DateTime date;
  List<Candidat> candidates = [];

  static List<Candidat> defaultCandidates = [
    Candidat.fromValues(
        id: "1234",
        reference: "1234G",
        firstName: "PrénomTest",
        lastName: "NomTest",
        dateNaissance: DateTime(1975, 1, 1))
  ];

  @ignore
  Session(
      {required this.id,
      required this.type,
      required this.date});

  static Session generateTestSession(
      String numeroSession, String typeSession, DateTime date) {
    Session testSession = Session(
        id: numeroSession,
        type: typeSession,
        date: date);
    
    testSession.candidates = defaultCandidates;
    return testSession;
  }

  String dateToString() {
    return DateTimeManager.dateTimeToString(date,
        format: DateTimeFormat.NORMAL,
        includeHours: false,
        todayRelative: false);
  }

  String durationToString() {
    return DateTimeManager.dateTimeToString(date,
        format: DateTimeFormat.PHRASE,
        includeHours: false,
        todayRelative: true);
  }

  String sessionTitleToString() {
    return "Session n°$id $type du ${dateToString()}";
  }
}
