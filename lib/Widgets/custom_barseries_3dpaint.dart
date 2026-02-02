import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomBar3DSeries extends BarSeriesRenderer<barSeriesData, String> {
  CustomBar3DSeries(this.topOvalColor);

  final Color topOvalColor;

  @override
  BarSegment<barSeriesData, String> createSegment() {
    return _CustomColumn3DPaint(topOvalColor);
  }
}

class _CustomColumn3DPaint extends BarSegment<barSeriesData, String> {
  _CustomColumn3DPaint(this.topOvalColors);

  final Color topOvalColors;

  @override


  void onPaint(Canvas canvas) {
    final double trackerTop = series.pointToPixelY(0, 20);
    final Rect trackerTopOval = _ovalRect(trackerTop);
    final Rect bottomOval = _ovalRect(segmentRect!.bottom);
    final Rect topOval = _ovalRect(segmentRect!.top);
    final Rect animatedTopOval = _ovalRect(segmentRect!.bottom -
        ((segmentRect!.bottom - segmentRect!.top) * animationFactor));

    super.onPaint(canvas);

    canvas.drawOval(topOval, Paint()..color = fillPaint.color);

    canvas.drawOval(bottomOval, Paint()..color = fillPaint.color);

    canvas.drawOval(topOval, Paint()..color = fillPaint.color);

    canvas.drawOval(
        animatedTopOval, Paint()..color = topOvalColors!);
  }

  Rect _ovalRect(double ovalCenterY) {
    const double ovalRadius = 10;
    return Rect.fromLTRB(segmentRect!.left, ovalCenterY - ovalRadius,
        segmentRect!.right, ovalCenterY + ovalRadius);
  }
}

class barSeriesData {
  barSeriesData(this.WeekName,this.SelfJBV,this.SelfRBV,this.TeamJBV,this.TeamRBV,this.colrSelfJBV,this.colrSelfRBV,this.colrTeamJBV,this.colrTeamRBV, );
  final String WeekName ;
  final int SelfJBV ;
  final int SelfRBV;
  final int TeamJBV;
  final int TeamRBV;
  final Color colrSelfJBV;
  final Color colrSelfRBV;
  final Color colrTeamJBV;
  final Color colrTeamRBV;
}

// +++++++++++++  +++++++++++ ++++++++++++++++++ +++++++++++++ +++++++++++++++

class VzoneCustomBar3DSeries extends BarSeriesRenderer<vzoneBarSeriesData, String> {
  VzoneCustomBar3DSeries(this.topOvalColor);

  final Color topOvalColor;

  @override
  BarSegment<vzoneBarSeriesData, String> createSegment() {
    return _VzoneCustomBar3DSeries(topOvalColor);
  }
}

class _VzoneCustomBar3DSeries extends BarSegment<vzoneBarSeriesData, String> {
  _VzoneCustomBar3DSeries(this.topOvalColors);

  final Color topOvalColors;

  @override


  void onPaint(Canvas canvas) {
    final double trackerTop = series.pointToPixelY(0, 20);
    final Rect trackerTopOval = _ovalRect(trackerTop);
    final Rect bottomOval = _ovalRect(segmentRect!.bottom);
    final Rect topOval = _ovalRect(segmentRect!.top);
    final Rect animatedTopOval = _ovalRect(segmentRect!.bottom -
        ((segmentRect!.bottom - segmentRect!.top) * animationFactor));

    super.onPaint(canvas);

    canvas.drawOval(topOval, Paint()..color = fillPaint.color);

    canvas.drawOval(bottomOval, Paint()..color = fillPaint.color);

    canvas.drawOval(topOval, Paint()..color = fillPaint.color);

    canvas.drawOval(
        animatedTopOval, Paint()..color = topOvalColors!);
  }

  Rect _ovalRect(double ovalCenterY) {
    const double ovalRadius = 10;
    return Rect.fromLTRB(segmentRect!.left, ovalCenterY - ovalRadius,
        segmentRect!.right, ovalCenterY + ovalRadius);
  }
}

class vzoneBarSeriesData {
  vzoneBarSeriesData(this.MonthName,this.totalPurchases ,this.totalSales,this.totalPurchasescolor,this.totalSalescolor,);
 final String MonthName;
  final int totalPurchases;
  final int totalSales;
  final Color totalPurchasescolor;
  final Color totalSalescolor;
}
