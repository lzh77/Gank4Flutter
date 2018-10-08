import 'package:flutter/material.dart';

abstract class BaseAdapter<T> {
  Widget convert(BuildContext context, T item);
}
