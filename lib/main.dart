///==========================================
/// Title:  SAB SYSTEM
/// Author: Thiago de Jesus Vieira
/// Date:   11 Mai 2022
///==========================================
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  conectionDB();
  runApp(const appEstacio());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

}
class appEstacio extends StatelessWidget {
  const appEstacio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),

    );
  }
}

Future<void> salvarDB(String cpf, String avaliacao) async{
  final _aluno = ParseObject('Alunos')
  ..set(
    'cpf', cpf
  )..set(
      'Avaliacao', avaliacao
    );
  await _aluno.save();
}
Future <void> conectionDB()async{
  final KeyApplicationId = 'KeyApplication';
  final KeyClientKey = 'KeyClient';
  final KeyParseServerUrl = 'Uri';

  await Parse().initialize(KeyApplicationId, KeyParseServerUrl, clientKey: KeyClientKey, autoSendSessionId: true);
}
