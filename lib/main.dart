import 'package:flutter/material.dart';
import 'package:soft_bd/application/app.dart';
import 'package:intl/date_symbol_data_local.dart'; 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('bn_BD', null);
  runApp(const SoftBd());
}
