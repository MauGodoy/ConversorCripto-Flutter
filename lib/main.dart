import 'package:flutter/material.dart';
import 'app/ui/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Conversor de Criptomoedas',
        theme: ThemeData(
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme:
            Theme.of(context).textTheme.apply(bodyColor: Colors.white70),
            canvasColor: Colors.green),
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/FundoApp.png"),
                fit: BoxFit.fill,
                colorFilter: new ColorFilter.mode(
                    Colors.white.withOpacity(0.3), BlendMode.colorDodge),
                alignment: Alignment.center),
          ),
          child: MyHomePage(title: 'Conversor CriptoMoedas AS em Flutter'),
        ));
  }
}
