import 'package:flutter/material.dart';

class AddBtn extends StatelessWidget {

  void Function() addBalance;
  AddBtn({super.key, required this.addBalance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1, 
      child: ElevatedButton(style: ElevatedButton.styleFrom( backgroundColor: Colors.red[700], minimumSize: const Size(double.infinity, 0), ),
        onPressed: addBalance, child: const Text('Add number')));
  }
}