import 'package:flutter/material.dart';

import '/classes/cbr.dart';
import '/classes/ceig.dart';
import '/classes/ctf_helper.dart';
import '/constant/colors.dart';
import '/customs/button.dart';
import '/customs/gap.dart';
import '/customs/loading.dart';
import '/customs/text_input.dart';
import '/functions/nav.dart';
import '/main.dart';
import '/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> callHello(String x) async {
    try {
      final result = await client.xM1haix.hello(x);
    } catch (e) {}
  }

  final List<CTFHelper> _ctfh =
      List.generate(2, (i) => CTFHelper(labelText: ["Discord ID", "CODE"][i]));
  bool _showPass = false, _connect = false, _save = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var e in _ctfh) {
      e.focusNode.dispose();
      e.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 600,
          ),
          width: 300,
          padding: CEIG.all(20).v,
          decoration: BoxDecoration(
            borderRadius: CBR.all(20).v,
            color: greyBlack12,
          ),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text("Login"),
              ),
              const Gap(h: 10),
              CustomTextField(
                onChanged: (value) {
                  setState(() {
                    _showPass = false;
                  });
                },
                x: _ctfh[0],
                suffixIcon: _showPass
                    ? null
                    : IconButton(
                        tooltip: "Send the code",
                        icon: const Icon(Icons.forward_outlined),
                        onPressed: () async {
                          loading(context);
                          await Future.delayed(const Duration(seconds: 1))
                              .then((value) => back(context));

                          setState(() {
                            _showPass = true;
                            _ctfh[1].controller.clear();
                            _connect = false;
                          });
                        },
                      ),
              ),
              const Gap(h: 20),
              if (_showPass)
                CustomTextField(
                  x: _ctfh[1],
                  onChanged: (value) {
                    setState(() {
                      _connect = value.isNotEmpty;
                    });
                  },
                ),
              if (_showPass) const Gap(h: 10),
              if (_showPass)
                CheckboxListTile(
                  contentPadding: CEIG.all(0).v,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    "Keep me signed in!",
                    style: TextStyle(
                      color: _save ? primary : null,
                    ),
                  ),
                  value: _save,
                  onChanged: (x) {
                    if (x == null) return;
                    setState(() {
                      _save = x;
                    });
                  },
                ),
              if (_showPass) const Gap(h: 10),
              if (_showPass)
                Center(
                  child: CustomButton(
                    borderRadius: 20,
                    width: 200,
                    height: 40,
                    backgroundColor: _connect ? primary : black,
                    onTap: _connect
                        ? () async {
                            loading(context);
                            await Future.delayed(const Duration(seconds: 1))
                                .then((value) => back(context));
                            if (!context.mounted) return;
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const Home(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          }
                        : null,
                    child: Text(
                      "Connect",
                      style: TextStyle(
                        fontSize: 20,
                        color: _connect ? black : primary,
                      ),
                    ),
                  ),
                ),
            ],
          )),
        ),
      ),
    );
  }
}
