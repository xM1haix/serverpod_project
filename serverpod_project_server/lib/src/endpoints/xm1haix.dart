import "package:serverpod/serverpod.dart";

class xM1haix extends Endpoint {
  Future<String> hello(Session session, String name) async {
    return "xM1haix:Hello $name";
  }
}
