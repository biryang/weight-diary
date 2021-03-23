import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weight_diary/models/diary_model.dart';

double zoomP = 0.5;
double zoomF = 1;

class BmiLineChart extends StatelessWidget {
  BmiLineChart({this.diaryData, this.max});

  final List<DiaryModel> diaryData;
  final double max;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Chart(
        diaryData: diaryData,
        max: max,
      ),
    );
  }
}

class Chart extends StatefulWidget {
  Chart({this.diaryData, this.max});

  final List<DiaryModel> diaryData;
  final double max;

  @override
  State<StatefulWidget> createState() {
    return ChartState();
  }
}

class ChartState extends State<Chart> {
  ChartState({Key key});

  ZoomPanBehavior _zoomPanBehavior;
  TooltipBehavior _tooltipBehavior;

  void refreshChart() {
    setState(() {});
  }

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true,
      enablePinching: true,
      enableDoubleTapZooming: true,
      zoomMode: ZoomMode.x,
    );
    _tooltipBehavior = TooltipBehavior(
      header: 'Weight',
      format: 'point.ykg',
      enable: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Color(0xff23b6e6));
    color.add(Color(0xff02d39a));

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(1.0);

    final LinearGradient gradientColors = LinearGradient(
      colors: color.map((e) => e.withOpacity(0.3)).toList(),
      stops: stops,
    );
    return SfCartesianChart(
      zoomPanBehavior: _zoomPanBehavior,
      onZooming: (ZoomPanArgs args) {
        if (args.axis.name == 'primaryXAxis') {
          zoomP = args.currentZoomPosition;
          zoomF = args.currentZoomFactor;
        }
      },
      primaryXAxis: CategoryAxis(
          zoomFactor: zoomF,
          zoomPosition: zoomP,
          name: 'primaryXAxis',
          isInversed: true),
      primaryYAxis: NumericAxis(
        name: 'primaryYAxis',
        minimum: 0,
        maximum: ((widget.max/10).roundToDouble() * 10)+10,
      ),
      tooltipBehavior: _tooltipBehavior,
      series: <CartesianSeries<DiaryModel, String>>[
        SplineAreaSeries<DiaryModel, String>(
          markerSettings: MarkerSettings(
            isVisible: true,
            color: Colors.white,
          ),
          gradient: gradientColors,
          borderWidth: 4,
          borderGradient: const LinearGradient(
            colors: <Color>[
              const Color(0xff23b6e6),
              const Color(0xff02d39a),
            ],
            stops: <double>[0.2, 0.9],
          ),
          dataSource: widget.diaryData,
          xValueMapper: (DiaryModel sales, _) => sales.date,
          yValueMapper: (DiaryModel sales, _) => sales.weight,
        ),
      ],
    );
  }
}
