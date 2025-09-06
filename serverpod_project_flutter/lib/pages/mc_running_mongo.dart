import "package:flutter/material.dart";

class MCRunningMongose extends StatefulWidget {
  const MCRunningMongose({super.key});

  @override
  State<MCRunningMongose> createState() => _MCRunningMongoseState();
}

class _MCRunningMongoseState extends State<MCRunningMongose>
    with SingleTickerProviderStateMixin {
  double _x = 0;
  late AnimationController _mcRunning;

  int get running => (_x * 60).toInt() % 6;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: _x * 170,
          ),
          if (_x < 0.5)
            Image.asset(
              "assets/animations/mc_running_$running.png",
            ),
          if (_x < 0.5)
            SizedBox(
              width: (0.5 - _x) * 170,
            ),
          Image.asset(
            'assets/animations/${_x > 0.5 ? 'mc' : 'empty'}_mongose.png',
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _mcRunning = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )
      ..addListener(() {
        setState(() {
          _x = _mcRunning.value;
        });
      })
      ..forward()
      ..repeat();
  }
}
