import 'package:flutter/material.dart';

class MCRunning extends StatefulWidget {
  const MCRunning({super.key});
  @override
  State<MCRunning> createState() => _MCRunningState();
}

class _MCRunningState extends State<MCRunning>
    with SingleTickerProviderStateMixin {
  late AnimationController _mcRunning;
  int _x = 0;
  void _listener() => setState(() => _x = (_mcRunning.value * 6).toInt());

  @override
  void initState() {
    super.initState();
    _mcRunning = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    )
      ..addListener(_listener)
      ..forward()
      ..repeat();
  }

  @override
  void dispose() {
    _mcRunning.stop();
    _mcRunning.removeListener(_listener);
    _mcRunning.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Image.asset(
        'assets/animations/mc_running_$_x.png',
      ),
    );
  }
}
