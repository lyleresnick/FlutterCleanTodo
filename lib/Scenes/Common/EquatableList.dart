import 'dart:collection';

class EquatableList<T> extends ListBase<T> {
  final List<T> _list;

  EquatableList() : _list = [];

  EquatableList.fromIterable(Iterable<T> iterable, {growable = true}) : _list = List.from(iterable, growable: growable);

  @override
  int get length => _list.length;

  @override
  set length(int newLength) {
    _list.length = newLength;
  }

  @override
  T operator [](int index) => _list[index];

  @override
  void operator []=(int index, T value) {
    _list[index] = value;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EquatableList<T>) return false;
    if (other.length != length) return false;

    for (int i = 0; i < length; i++) {
      if (other[i] != this[i]) {
        return false;
      }
    }

    return true;
  }

  @override
  int get hashCode => _list.hashCode;
}

extension EqListExtension<T> on Iterable<T> {
  EquatableList<T> toEquatableList({bool growable = true }) {
    return EquatableList.fromIterable(this, growable: growable);
  }
}

