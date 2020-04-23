import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

class VentasPage extends StatefulWidget {
  const VentasPage({Key key}) : super(key: key);

  @override
  _VentasPageState createState() => _VentasPageState();
}

class _VentasPageState extends State<VentasPage> {
  final formato = NumberFormat('#,###');

  DateTime fechaInicial;
  DateTime fechaFinal;
  List<PedidosTienda> dataPedidosTienda = [
    PedidosTienda('Chia Fruver', 154, 20042540),
    PedidosTienda('Bog sta fe', 106, 14683970),
    PedidosTienda('Bog Cdad Jardin', 100, 14326670),
    PedidosTienda('Bog Suba Vll eliza', 70, 10377460),
    PedidosTienda('Med volador', 69, 9179410),
    PedidosTienda('Med Tarapaca', 68, 8689390),
    PedidosTienda('Bog quintaparedes', 59, 7214370),
    PedidosTienda('Bog barranxas', 36, 5814170),
    PedidosTienda('Med el diamante', 34, 5016740),
    PedidosTienda('Bog suba salitre', 33, 4228320),
    PedidosTienda('Bog la uribe', 28, 2944420),
    PedidosTienda('Bog san javier', 19, 2741700),
    PedidosTienda('Bog country', 18, 2500430),
    PedidosTienda('Bog floresta', 14, 1792870),
  ];

  List<charts.Series<PedidosTienda, String>> _dataPedidosTiendaCant() {
    return [
      charts.Series<PedidosTienda, String>(
        id: 'Pedidos dia',
        data: dataPedidosTienda,
        domainFn: (PedidosTienda pedido, __) =>
            "Fecha: ${pedido.shop} => Cant ",
        measureFn: (PedidosTienda pedido, __) => pedido.amount,
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(getPrimaryColor(context)),
        labelAccessorFn: (PedidosTienda pedido, _) =>
            '${pedido.shop}: ${pedido.amount}',
        insideLabelStyleAccessorFn: (PedidosTienda pedido, _) {
          return new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(
                  Theme.of(context).textTheme.caption.color)); //color de adentro
        },
        outsideLabelStyleAccessorFn: (PedidosTienda pedido, _) {
          return new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(
                  Colors.blue)); //color de afuera
        },  
      )
    ];
  }

  List<charts.Series<PedidosTienda, String>> _dataPedidosTiendaVal() {
    return [
      charts.Series<PedidosTienda, String>(
        id: 'Pedidos dia',
        data: dataPedidosTienda,
        domainFn: (PedidosTienda pedido, __) =>
            "Fecha: ${pedido.shop} => valor ",
        measureFn: (PedidosTienda pedido, __) => pedido.value,
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(getPrimaryColor(context)),
        labelAccessorFn: (PedidosTienda pedido, _) =>
            '${pedido.shop}: ${formato.format(pedido.value)}',
        insideLabelStyleAccessorFn: (PedidosTienda pedido, _) {
          return new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(
                  Colors.blue)); //color de adentro
        },
        outsideLabelStyleAccessorFn: (PedidosTienda pedido, _) {
          return new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(
                  Colors.blue)); //color de afuera
        },
      )
    ];
  }

  List<PedidosDia> dataPedidosDia = [
    PedidosDia(DateTime.parse('2020-04-10'), 7, 399560),
    PedidosDia(DateTime.parse('2020-04-11'), 21, 2338430),
    PedidosDia(DateTime.parse('2020-04-12'), 42, 5623470),
    PedidosDia(DateTime.parse('2020-04-13'), 25, 3729670),
    PedidosDia(DateTime.parse('2020-04-14'), 18, 2180310),
    PedidosDia(DateTime.parse('2020-04-15'), 18, 3020260),
    PedidosDia(DateTime.parse('2020-04-16'), 13, 1990000),
    PedidosDia(DateTime.parse('2020-04-17'), 46, 7003620),
    PedidosDia(DateTime.parse('2020-04-18'), 294, 38556130),
    PedidosDia(DateTime.parse('2020-04-19'), 113, 15531570),
    PedidosDia(DateTime.parse('2020-04-20'), 227, 32647330),
  ];

  bool value = false;
  List<PedidosDia> data;
  @override
  void initState() {
    super.initState();
  }

  List<charts.Series<PedidosDia, String>> _dataPedidosDiaCant() {
    return [
      charts.Series<PedidosDia, String>(
        id: 'Pedidos dia',
        data: data,
        domainFn: (PedidosDia pedido, __) =>
            "Fecha: ${pedido.day.month}/${pedido.day.day} => Cant ",
        measureFn: (PedidosDia pedido, __) => pedido.amount,
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(getPrimaryColor(context)),
        labelAccessorFn: (PedidosDia pedido, _) =>
            '${pedido.day.day}/${pedido.day.month}/${pedido.day.year}: ${pedido.amount}',
        insideLabelStyleAccessorFn: (PedidosDia pedido, _) {
          return new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(
                  Colors.blue)); //color de adentro
        },
        outsideLabelStyleAccessorFn: (PedidosDia pedido, _) {
          return new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(
                  Colors.blue)); //color de afuera
        },
      )
    ];
  }

  List<charts.Series<PedidosDia, String>> _dataPedidosDiaVal() {
    return [
      charts.Series<PedidosDia, String>(
        id: 'Pedidos dia',
        data: data,
        domainFn: (PedidosDia pedido, __) =>
            "Fecha: ${pedido.day.month}/${pedido.day.day} => valor ",
        measureFn: (PedidosDia pedido, __) => pedido.value,
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(getPrimaryColor(context)),
        labelAccessorFn: (PedidosDia pedido, _) =>
            '${pedido.day.day}/${pedido.day.month}/${pedido.day.year}: ${pedido.value}',
        insideLabelStyleAccessorFn: (PedidosDia pedido, _) {
          return new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(
                  Colors.blue)); //color de adentro
        },
        outsideLabelStyleAccessorFn: (PedidosDia pedido, _) {
          return new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(
                  Colors.blue)); //color de afuera
        },
      )
    ];
  }

  DateTime selectedDate = DateTime.now();

  Color getPrimaryColor(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return color;
  }

  @override
  Widget build(BuildContext context) {
    getPrimaryColor(context);
    data = fechaInicial == null || fechaFinal == null
        ? dataPedidosDia.where((i) => i.day.day < 13).toList()
        : dataPedidosDia
            .where((i) =>
                i.day.isAfter(fechaInicial.add(Duration(days: -1))) &&
                i.day.isBefore(fechaFinal.add(Duration(days: 1))))
            .toList();
    return SafeArea(
      bottom: true,
      top: false,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: getPrimaryColor(context),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  child: Text("Cantidad"),
                ),
                Tab(
                  child: Text("Valor"),
                ),
              ],
            ),
            title: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://chefmenu.co/restaurantes/bogota/tiendas-d1/tiendas-d1-logo.jpg'),
                        ),
                      ),
                      height: 24,
                      width: 24,
                    ),
                    Text('   Ventas')
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width / 3,
                          child: RaisedButton(
                              color: getPrimaryColor(context),
                              textColor: Colors.white,
                              child: Text(fechaInicial != null
                                  ? "${fechaInicial.day}/${fechaInicial.month}/${fechaInicial.year}"
                                  : 'Fecha inicial'),
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: fechaInicial != null
                                      ? fechaInicial
                                      : DateTime.now(),
                                  firstDate: dataPedidosDia.first.day,
                                  lastDate: DateTime.now(),
                                ).then((v) {
                                  fechaInicial = v;
                                  setState(() {});
                                });
                              }),
                        ),
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width / 3,
                          child: RaisedButton(
                              color: getPrimaryColor(context),
                              textColor: Colors.white,
                              child: Text(fechaFinal != null
                                  ? "${fechaFinal.day}/${fechaFinal.month}/${fechaFinal.year}"
                                  : 'Fecha final'),
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: fechaFinal != null
                                      ? fechaFinal
                                      : fechaInicial != null
                                          ? fechaInicial.add(Duration(days: 10))
                                          : DateTime.now(),
                                  firstDate: fechaInicial,
                                  lastDate:
                                      (fechaInicial.add(Duration(days: 10))),
                                ).then((v) {
                                  fechaFinal = v;
                                  setState(() {});
                                });
                              }),
                        )
                      ]),
                ]),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Card(
                        elevation: 4,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Cantidad de pedidos',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height *
                                    (data.length / 10),
                                child: charts.BarChart(
                                  _dataPedidosDiaCant(),
                                  vertical: false,
                                  animate: true,
                                  barRendererDecorator:
                                      new charts.BarLabelDecorator<String>(),
                                  domainAxis: new charts.OrdinalAxisSpec(
                                      renderSpec: new charts.NoneRenderSpec()),
                                  behaviors: [
                                    charts.DatumLegend(
                                        horizontalFirst: false,
                                        showMeasures: true,
                                        // desiredMaxRows: 2,
                                        // desiredMaxColumns: 2,
                                        outsideJustification:
                                            charts.OutsideJustification.start,
                                        legendDefaultMeasure: charts
                                            .LegendDefaultMeasure.firstValue,
                                        insideJustification: charts
                                            .InsideJustification.topStart),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 4,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Cantidad de pedidos por tienda',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height *
                                    (dataPedidosTienda.length / 30),
                                child: charts.BarChart(
                                  _dataPedidosTiendaCant(),
                                  vertical: false,
                                  animate: true,
                                  barRendererDecorator:
                                      new charts.BarLabelDecorator<String>(),
                                  domainAxis: new charts.OrdinalAxisSpec(
                                      renderSpec: new charts.NoneRenderSpec()),
                                  // behaviors: [
                                  //   charts.DatumLegend(
                                  //       horizontalFirst: false,
                                  //       showMeasures: true,
                                  //       // desiredMaxRows: 2,
                                  //       // desiredMaxColumns: 2,
                                  //       outsideJustification:
                                  //           charts.OutsideJustification.start,
                                  //       legendDefaultMeasure: charts
                                  //           .LegendDefaultMeasure.firstValue,
                                  //       insideJustification: charts
                                  //           .InsideJustification.topStart),
                                  // ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Card(
                        elevation: 4,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Valor de pedidos por dia',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height *
                                    (data.length / 10),
                                child: charts.BarChart(
                                  _dataPedidosDiaVal(),
                                  vertical: false,
                                  animate: true,
                                  barRendererDecorator:
                                      new charts.BarLabelDecorator<String>(),
                                  domainAxis: new charts.OrdinalAxisSpec(
                                      renderSpec: new charts.NoneRenderSpec()),
                                  behaviors: [
                                    charts.DatumLegend(
                                        horizontalFirst: false,
                                        showMeasures: true,
                                        // desiredMaxRows: 2,
                                        // desiredMaxColumns: 2,
                                        outsideJustification:
                                            charts.OutsideJustification.start,
                                        legendDefaultMeasure: charts
                                            .LegendDefaultMeasure.firstValue,
                                        insideJustification: charts
                                            .InsideJustification.topStart),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 4,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Valor de pedidos por tienda',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height *
                                    (dataPedidosTienda.length / 30),
                                child: charts.BarChart(
                                  _dataPedidosTiendaVal(),
                                  vertical: false,
                                  animate: true,
                                  barRendererDecorator:
                                      new charts.BarLabelDecorator<String>(),
                                  domainAxis: new charts.OrdinalAxisSpec(
                                      renderSpec: new charts.NoneRenderSpec()),
                                  // behaviors: [
                                  //   charts.DatumLegend(
                                  //       horizontalFirst: false,
                                  //       showMeasures: true,
                                  //       // desiredMaxRows: 2,
                                  //       // desiredMaxColumns: 2,
                                  //       outsideJustification:
                                  //           charts.OutsideJustification.start,
                                  //       legendDefaultMeasure: charts
                                  //           .LegendDefaultMeasure.firstValue,
                                  //       insideJustification: charts
                                  //           .InsideJustification.topStart),
                                  // ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PedidosDia {
  final DateTime day;
  final int amount;
  final int value;

  PedidosDia(this.day, this.amount, this.value);
}

class PedidosTienda {
  final String shop;
  final int amount;
  final int value;

  PedidosTienda(this.shop, this.amount, this.value);
}
