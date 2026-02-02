import 'package:flutter/material.dart';
import 'dart:async';

class PurchaseCountdownWidget extends StatefulWidget {
  final int pvRequired; // Simulating `Model.dashBoard_OP.PV_Required`
  final Duration countdownDuration; // Duration to count down

  const PurchaseCountdownWidget({
    Key? key,
    required this.pvRequired,
    required this.countdownDuration,
  }) : super(key: key);

  @override
  _PurchaseCountdownWidgetState createState() =>
      _PurchaseCountdownWidgetState();
}

class _PurchaseCountdownWidgetState extends State<PurchaseCountdownWidget> {
  late Duration remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remaining = widget.countdownDuration;
    if (widget.pvRequired == 0) {
      startCountdown();
    }
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (remaining.inSeconds == 0) {
        _timer?.cancel();
      } else {
        setState(() {
          remaining -= Duration(seconds: 1);
        });
      }
    });
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = remaining.inDays;
    final hours = remaining.inHours % 24;
    final minutes = remaining.inMinutes % 60;
    final seconds = remaining.inSeconds % 60;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(5),

      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(Icons.timer,
              color: Colors.white,
              size: 25,
              // fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Purchase Countdown',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.pvRequired == 0
                      ? '$days Days ${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}'
                      : widget.pvRequired == 2
                      ? ''
                      : 'Purchase Required',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
