
import 'package:flutter/material.dart';

extension CopyWithToText on Text {
  Text copyWith(TextStyle textStyle) {
    return Text(
      data ?? '',
      style: style == null ? const TextStyle() : style!.merge(textStyle),
    );
  }
}
