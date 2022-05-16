///==========================================
/// Title:  SAB SYSTEM
/// Author: Thiago de Jesus Vieira
/// Date:   11 Mai 2022
///==========================================

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'vote.dart';
import 'package:untitled/main.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool isButtonActive = true;
  static late TextEditingController _cpfController = TextEditingController();
  var input = '';

  void salvar() {
    String cpf = _cpfController.text;
    print("CPF" + cpf.toString());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => vote(cpf)),
    );
  }

  @override
  void initState() {
    super.initState();
    _cpfController = TextEditingController();
    _cpfController.addListener(() {
      final isButtonActive = _cpfController.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    _cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff034168),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'lib/imgs/estacio.png',
                  width: 400.0,
                  height: 300.0,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'lib/imgs/texto.png',
                ),
              ],
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 200),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  controller: _cpfController,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                  cursorColor: Colors.white,
                  maxLength: 11,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: UnderlineInputBorder(),
                    labelText: 'Digite seu CPF: ',
                  ),
                )),
            Container(
              child: const Padding(
                padding: EdgeInsets.only(top: 60),
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      overlayColor: MaterialStateProperty.all(Colors.black12),
                      elevation: MaterialStateProperty.all(20),
                      minimumSize:
                          MaterialStateProperty.all(const Size(200, 40)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(35)),
                    ),
                    onPressed: isButtonActive
                        ? () {
                            salvar();
                            setState(() => isButtonActive = false);
                          }
                        : null,
                    child: const Text(
                      'Iniciar',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
