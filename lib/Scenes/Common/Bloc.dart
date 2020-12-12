abstract class Bloc<Output> {

  Stream<Output> get stream;
  void dispose();
}