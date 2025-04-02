import 'package:componentes5b25/models/ventas.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    // Datos a graficar
    final List<Ventas> data = [
      Ventas('Lunes', 75),
      Ventas('Martes', 50),
      Ventas('Miércoles', 100),
      Ventas('Jueves', 40),
      Ventas('Viernes', 25),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Tercer ventana')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY:
                data
                    .map((venta) => venta.venta)
                    .reduce((a, b) => a > b ? a : b) +
                10,
            barTouchData: BarTouchData(enabled: true),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 10,
                  reservedSize: 40,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    return Text(
                      value.toInt().toString(),
                      style: const TextStyle(color: Colors.black),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    if (value.toInt() < data.length) {
                      return Text(data[value.toInt()].dia);
                    }
                    return const Text('');
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            barGroups:
                data
                    .asMap()
                    .entries
                    .map(
                      (entry) => BarChartGroupData(
                        x: entry.key,
                        barRods: [
                          BarChartRodData(toY: entry.value.venta.toDouble()),
                        ],
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}
