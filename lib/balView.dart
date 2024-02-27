import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class BalView extends StatelessWidget {
  double bal;
  BalView({super.key,required this.bal});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Balance Part'),
          const SizedBox(height: 20),
          Text("\$ ${NumberFormat.simpleCurrency(name: '').format(bal)}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}