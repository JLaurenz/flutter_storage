import 'package:flutter/material.dart';
import 'package:flutter_storage/balView.dart';
import 'package:flutter_storage/btnBalance.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    loadBal();
    super.initState();
  }

  double bal = 0;
  void btnFnc() async{
    setState(() {
      bal = bal+500;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Save an double value to 'decimal' key.
    await prefs.setDouble('bal', bal);
  }

  void loadBal() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bal = prefs.getDouble('bal') ?? 0;
      // ?? null aware operator      
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(appBar: AppBar(centerTitle:true, title: const Text('Flutter Storage'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.blueGrey[700],
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [  
            BalView(bal: bal),
            AddBtn(addBalance: btnFnc) // addBalance is from btnBalance : btnFnc is main function 
          ],
        ))),
    );
  }
}