///==========================================
/// Title:  SAB SYSTEM
/// Author: Thiago de Jesus Vieira
/// Date:   11 Mai 2022
///==========================================

import 'package:flutter/cupertino.dart';
import 'package:untitled/main.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/widgets/sliderTrackShape.dart';
class vote extends StatefulWidget {
  String cpf;
  vote(this.cpf, {Key? key}) : super(key: key);

  @override
  State<vote> createState() => _voteState();
}

class _voteState extends State<vote> {
  double _currentStateValue = 0;
  static const _emoji = [
    'lib/imgs/red.png', //0
    'lib/imgs/orange.png', //1
    'lib/imgs/yellow.png', //2
    'lib/imgs/greenocean.png', //3
    'lib/imgs/green.png', //4
  ];

  LinearGradient gradient = const LinearGradient(colors: <Color>[
    Color(0xffea0000),
    Color(0xfff40000),
    Colors.red,
    Colors.yellow,
    Color(0xff228B22),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff034168),
        body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 250),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 30),
                _currentStateValue == 0
                    ? const Text(
                        "",
                        style: TextStyle(color: Colors.white),
                      )
                    : _currentStateValue <= 6
                        ? Image.asset(_emoji[0], width: 95, height: 95)
                        : _currentStateValue < 8
                            ? Image.asset(_emoji[2], width: 95, height: 95)
                            : _currentStateValue < 9
                                ? Image.asset(_emoji[2], width: 95, height: 95)
                                : _currentStateValue < 10
                                    ? Image.asset(_emoji[3],
                                        width: 95, height: 95)
                                    : _currentStateValue == 10
                                        ? Image.asset(_emoji[4],
                                            width: 95, height: 95)
                                        : const Text('Emoji'),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Como foi sua experiência?",
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            child: const Padding(
                              padding: EdgeInsets.only(top: 30),
                            ),
                          ),
                          const Text(
                            'Arraste a barra abaixo 👇 e depois clique no botão "Continuar" =)',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: const Padding(
                    padding: EdgeInsets.only(top: 60),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: SliderTheme(
                    data: SliderThemeData(
                        activeTrackColor: Colors.white.withOpacity(0.5),
                        thumbColor: const Color(0xff56C1EF), // Cor do icone
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius:
                                20.0), // Tamanho do icone para arrastar
                        overlayColor: const Color(0xff56C1EF).withAlpha(32),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 40),
                        trackHeight: 20.0, // Largura da Barra
                        trackShape: GradientRectSliderTrackShape(
                            gradient: gradient, darkenInactive: false),
                        valueIndicatorShape:
                            const PaddleSliderValueIndicatorShape(),
                        valueIndicatorTextStyle: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        )),
                    child: Slider(
                        value:
                            _currentStateValue, //variavel que seta um valor iniciando em zero
                        min: 0,
                        max: 10,
                        divisions: 10,
                        label: _currentStateValue.round().toString(),
                        onChangeStart: (double value) {
                          print('Start Value is ' + value.toString());
                        },
                        onChangeEnd: (double value) {
                          print('Finish Value is ' + value.toString());
                        },
                        onChanged: (double value) {
                          setState(() {
                            _currentStateValue =
                                value; // recebe o valor da posição
                          });
                        }),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('lib/imgs/bar.png', width: 920, height: 141),
                  ],
                ),
                Container(
                  child: const Padding(
                    padding: EdgeInsets.only(top: 40),
                  ),
                ),
                ElevatedButton(
                    child: const Text(
                      'Continuar',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                      overlayColor: MaterialStateProperty.all(Colors.black26),
                      elevation: MaterialStateProperty.all(20),
                      minimumSize:
                          MaterialStateProperty.all(const Size(200, 40)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(35)),
                    ),
                    onPressed: () {
                      var cpf = widget.cpf;
                      var avaliation = _currentStateValue
                          .toString(); // Salva o valor da avaliação na variavel avaliation
                      print('Avaliação ' + avaliation);
                      conectionDB();
                      salvarDB(cpf, avaliation);
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            Future.delayed(Duration(seconds: 30), () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const home()));
                            });
                            return AlertDialog(
                              insetPadding: const EdgeInsets.all(100),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                      'Gostaria de falar mais sobre sua experiência, Leia o QR Code abaixo: '),
                                  Image.asset("lib/imgs/QRCODE.png"),
                                  Container(
                                      padding: const EdgeInsets.all(20),
                                      child: const Text(
                                        '    Clique no botão abaixo\npara finalizar sua avaliação!',
                                        style: TextStyle(fontSize: 30),
                                      )),
                                ],
                              ),
                              actions: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const home()),
                                        ),
                                      },
                                      icon: const Icon(Icons.check_circle,
                                          color: Colors.indigo),
                                      iconSize: 200.0,
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ],
                            );
                          });
                    }),
              ],
            )));
  }
}

