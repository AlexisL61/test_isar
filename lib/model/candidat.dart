import 'package:isar/isar.dart';
import 'package:test_isar/model/session.dart';

part 'candidat.g.dart';

@embedded
class Candidat {
  late String id;
  late String reference;
  late String firstName;
  late String lastName;
  late DateTime dateNaissance;

  @ignore
  Session? _session;


  Candidat();

  Candidat.fromValues({required this.id, required this.reference, required this.firstName, required this.lastName, required this.dateNaissance});

  @ignore
  set session (Session? s) {
    _session = s;
    if (s!=null) {
      //sessionId = s.id;
    }
  }

  @ignore
  Session? get session{
    return _session;
  }

  String candidatReferenceNameToString() {
    return "$reference - $firstName $lastName";
  }
}
