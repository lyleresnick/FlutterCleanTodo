abstract class Bloc<Output> {

  void emit(Output value);
  Stream<Output> get stream;
  void dispose();
}