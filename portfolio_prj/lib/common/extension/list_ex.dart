import 'package:flutter/material.dart';

extension ListExt<T> on List<T> {
  Iterable<A> mapSeperator<A>(A Function(int index, T data) convert) sync* {
    for (var i = 0; i < length; i++) {
      yield convert.call(i, this[i]);
    }
  }
}

extension ListExtWidget on List<Widget> {
  List<Widget> addSeperator(Widget seperator) {
    return mapSeperator((int index, Widget data) => <Widget>[
          if (index != 0) seperator,
          data
        ]).expand((element) => element).toList();
  }
}
