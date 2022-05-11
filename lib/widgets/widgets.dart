
import 'package:flutter/material.dart';
class _FloatingActionButtonDemoState extends StatelessWidget {
  get floatingActionButton => null;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: (
          floatingActionButton(
            FloatingActionButton.extended(
            onPressed: (){},
            label: const Text('Próximo'),
            icon: const Icon(Icons.thumb_up),
            backgroundColor: const Color(0xff1e14de),
          ),)

    )

    );
  }
}

