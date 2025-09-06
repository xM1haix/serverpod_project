import "package:flutter/material.dart";

class MCRunning extends StatefulWidget {
  const MCRunning({super.key});
  @override
  State<MCRunning> createState() => _MCRunningState();
}

class _MCRunningState extends State<MCRunning>
    with SingleTickerProviderStateMixin {
  late AnimationController _mcRunning;
  var _x = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Image.asset(
        "assets/animations/mc_running_$_x.png",
      ),
    );
  }

  @override
  void dispose() {
    _mcRunning
      ..stop()
      ..removeListener(_listener)
      ..dispose();
    super.dispose();
  }

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

  void _listener() => setState(() => _x = (_mcRunning.value * 6).toInt());
}
