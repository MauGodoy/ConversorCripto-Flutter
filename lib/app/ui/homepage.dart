import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mercado_bitcoin_app/app/services/api.dart';
import 'package:mercado_bitcoin_app/app/services/api_service.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final realController = TextEditingController();
  final btcController = TextEditingController();
  final ltcController = TextEditingController();
  final adaController = TextEditingController();
  final uniController = TextEditingController();
  final usdcController = TextEditingController();


  var _buybtc;
  var _buyltc;
  var _buyada;
  var _buyuni;
  var _buyusdc;

/*Neste parte e encaminho para a API, passando a moeta deseja e metodo que no caso é ticker*/
  Future<void> _initAttribs() async {
    final servicebtc = new APIService(new MercadoBitcoinAPI());
    final resTickerParsedbtc =
    await servicebtc.getEndpointData(coin: "btc", method: "ticker");

///////////////////////////////////
    final serviceltc = new APIService(new MercadoBitcoinAPI());
    final resTickerParsedltc =
    await serviceltc.getEndpointData(coin: "ltc", method: "ticker");

    ///////////////////////////////////
    final serviceada = new APIService(new MercadoBitcoinAPI());
    final resTickerParsedada =
    await serviceltc.getEndpointData(coin: "ada", method: "ticker");

    ///////////////////////////////////
    final serviceuni = new APIService(new MercadoBitcoinAPI());
    final resTickerParseduni =
    await serviceltc.getEndpointData(coin: "uni", method: "ticker");

    ///////////////////////////////////////
    final serviceusdc = new APIService(new MercadoBitcoinAPI());
    final resTickerParsedusdc =
    await serviceusdc.getEndpointData(coin: "usdc", method: "ticker");

    // Adiciona o valor da moeda na variavel
    setState(() {
      _buybtc = resTickerParsedbtc['ticker']['buy'].substring(0, 7);
      _buyltc = resTickerParsedltc['ticker']['buy'].substring(0, 7);
      _buyada = resTickerParsedada['ticker']['buy'].substring(0, 7);
      _buyuni = resTickerParseduni['ticker']['buy'].substring(0, 7);
      _buyusdc = resTickerParsedusdc['ticker']['buy'].substring(0, 7);
    });
  }

  /*Responsavel por apagar os dados dos campos simultaneamente*/
  void _clearAll() {
    realController.text = "";
    btcController.text = "";
    ltcController.text = "";
    adaController.text = "";
    uniController.text = "";
    usdcController.text = "";
  }

  @override
  void initState() {
    _initAttribs();
    super.initState();
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double entrada = double.parse(text);
    double btc = double.parse(_buybtc);
    double ltc = double.parse(_buyltc);
    double ada = double.parse(_buyada);
    double uni = double.parse(_buyuni);
    double usdc = double.parse(_buyusdc);
    btcController.text = (entrada / btc).toStringAsFixed(2);
    ltcController.text = (entrada / ltc).toStringAsFixed(2);
    adaController.text = (entrada / ada).toStringAsFixed(2);
    uniController.text = (entrada / uni).toStringAsFixed(2);
    usdcController.text = (entrada / usdc).toStringAsFixed(2);
  }

  /*Para calcular o valor das moedas e feito a entrada do usuario vezes o
  valor da criptomoeda dada pela API, que vai resulta o valor em reais,
   esse valor em reais obitido e divido pelo valor da criptomoeda dada pela API
   em reais, para fazer a converção fazendo um caminho inverso */
  void _btcChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double entrada = double.parse(text);
    double btc = double.parse(_buybtc);
    double ltc = double.parse(_buyltc);
    double ada = double.parse(_buyada);
    double uni = double.parse(_buyuni);
    double usdc = double.parse(_buyusdc);
    realController.text = (btc * entrada).toStringAsFixed(2);
    ltcController.text = (btc * entrada / ltc).toStringAsFixed(2);
    adaController.text = (btc * entrada / ada).toStringAsFixed(2);
    uniController.text = (btc * entrada / uni).toStringAsFixed(2);
    usdcController.text = (btc * entrada / usdc).toStringAsFixed(2);
  }

  void _ltcChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double entrada = double.parse(text);
    double btc = double.parse(_buybtc);
    double ltc = double.parse(_buyltc);
    double ada = double.parse(_buyada);
    double uni = double.parse(_buyuni);
    double usdc = double.parse(_buyusdc);
    realController.text = (ltc * entrada).toStringAsFixed(2);
    btcController.text = (ltc * entrada / btc).toStringAsFixed(2);
    adaController.text = (ltc * entrada / ada).toStringAsFixed(2);
    uniController.text = (ltc * entrada / uni).toStringAsFixed(2);
    usdcController.text = (ltc * entrada / usdc).toStringAsFixed(2);
  }

  void _adaChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double entrada = double.parse(text);
    double btc = double.parse(_buybtc);
    double ltc = double.parse(_buyltc);
    double ada = double.parse(_buyada);
    double uni = double.parse(_buyuni);
    double usdc = double.parse(_buyusdc);
    realController.text = (ada * entrada).toStringAsFixed(2);
    btcController.text = (ada * entrada / btc).toStringAsFixed(2);
    ltcController.text = (ada * entrada / ltc).toStringAsFixed(2);
    uniController.text = (ada * entrada / uni).toStringAsFixed(2);
    usdcController.text = (ada * entrada / usdc).toStringAsFixed(2);
  }

  void _uniChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double entrada = double.parse(text);
    double btc = double.parse(_buybtc);
    double ltc = double.parse(_buyltc);
    double ada = double.parse(_buyada);
    double uni = double.parse(_buyuni);
    double usdc = double.parse(_buyusdc);
    realController.text = (uni * entrada).toStringAsFixed(2);
    btcController.text = (uni * entrada / btc).toStringAsFixed(2);
    ltcController.text = (uni * entrada / ltc).toStringAsFixed(2);
    adaController.text = (uni * entrada / ada).toStringAsFixed(2);
    usdcController.text = (uni * entrada / usdc).toStringAsFixed(2);
  }

  void _usdcChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double entrada = double.parse(text);
    double btc = double.parse(_buybtc);
    double ltc = double.parse(_buyltc);
    double ada = double.parse(_buyada);
    double uni = double.parse(_buyuni);
    double usdc = double.parse(_buyusdc);
    realController.text = (usdc * entrada).toStringAsFixed(2);
    btcController.text = (usdc * entrada / btc).toStringAsFixed(2);
    ltcController.text = (usdc * entrada / ltc).toStringAsFixed(2);
    adaController.text = (usdc * entrada / ada).toStringAsFixed(2);
    uniController.text = (usdc * entrada / uni).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          /*Aqui e criado os campos para entrada do usuario assim como
                      chamado a metodo que calcula o valor de cada moeda*/
          Column(children: <Widget>[
            Padding(padding: EdgeInsets.all(10)),
            buildTextField("Real", "R\$", realController,_realChanged),
            Divider(),
            buildTextField("BTC", "₿", btcController,_btcChanged),
            Divider(),
            buildTextField("LTC", "Ł", ltcController,_ltcChanged),
            Divider(),
            buildTextField("ADA", "", adaController,_adaChanged),
            Divider(),
            buildTextField("UNI", "", uniController,_uniChanged),
            Divider(),
            buildTextField("USDC", "\$", usdcController,_usdcChanged),
            Divider(),
          ]),
        ],
      ),
    );
  }

  /*Responsavel pelo stilo dos campos*/
  buildTextField(String label, String prefix, TextEditingController c,
      Function f) {
    return TextField(
      controller: c,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.yellow),
          border: OutlineInputBorder(),
          prefixText: prefix
      ),
      style: TextStyle(
          color: Colors.lightBlue, fontSize: 25.0
      ),
      onChanged: f,
      keyboardType: TextInputType.number,
    );
  }
}

