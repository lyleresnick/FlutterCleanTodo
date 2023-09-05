//  Copyright (c) 2020 Lyle Resnick. All rights reserved.

abstract interface class Bloc<Output> {

  void emit(Output value);
  Stream<Output> get stream;
  void dispose();
}