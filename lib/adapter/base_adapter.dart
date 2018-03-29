import 'package:flutter/material.dart';

abstract class BaseAdapter {
  Widget convert(BuildContext context, Map<String, dynamic> item);
}
