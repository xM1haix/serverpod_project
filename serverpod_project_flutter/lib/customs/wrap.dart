import 'package:flutter/material.dart';

import '/classes/cbr.dart';
import '/classes/ceig.dart';
import '/classes/wrap_helper.dart';
import '/constant/colors.dart';
import '/customs/cache_image.dart';
import '/functions/nav.dart';

class CustomWrap extends StatelessWidget {
  final List<WrapHelper> children;
  const CustomWrap({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CEIG.all(20).v,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 50,
        spacing: 50,
        children: children.map((e) => WrapElement(e)).toList(),
      ),
    );
  }
}

class WrapElement extends StatefulWidget {
  final WrapHelper e;
  const WrapElement(this.e, {super.key});

  @override
  State<WrapElement> createState() => _WrapElementState();
}

class _WrapElementState extends State<WrapElement> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 350,
      width: 250,
      child: InkWell(
        borderRadius: CBR.all(10).v,
        onHover: (value) => setState(() {
          _hover = value;
        }),
        onTap: () => nav(widget.e.nav, context),
        child: AnimatedContainer(
          alignment: Alignment.center,
          padding: CEIG.all(_hover ? 20 : 10).v,
          duration: const Duration(seconds: 1),
          height: _hover ? 350 : 340,
          width: _hover ? 250 : 240,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: !_hover ? [gray80, gray80] : [white, transparent],
            ),
            borderRadius: CBR.all(10).v,
            border: Border.all(
              color: _hover ? primary : transparent,
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CacheImage(
                image: widget.e.image,
              ),
              const Spacer(),
              Text(widget.e.title),
            ],
          ),
        ),
      ),
    );
  }
}
