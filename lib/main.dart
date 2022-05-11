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
  final KeyApplicationId = 'EEvQ61dQLvH8SoBJ0ps3ilSJ2TObdRdxP4BBnRii';
  final KeyClientKey = 'MbPhZmWu5Iorxtw1VGK8phVv4hGZXvwEW8T9GgUt';
  final KeyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(KeyApplicationId, KeyParseServerUrl, clientKey: KeyClientKey, autoSendSessionId: true);
}