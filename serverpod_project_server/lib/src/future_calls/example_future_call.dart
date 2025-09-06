import "package:serverpod/serverpod.dart";

class ExampleFutureCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    // Do something interesting in the future here.
  }
}
