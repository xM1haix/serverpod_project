import "dart:async";

import "package:flutter/material.dart";
import "package:serverpod_project_flutter/classes/cbr.dart";
import "package:serverpod_project_flutter/classes/ceig.dart";
import "package:serverpod_project_flutter/classes/ctf_helper.dart";
import "package:serverpod_project_flutter/constant/colors.dart";
import "package:serverpod_project_flutter/customs/button.dart";
import "package:serverpod_project_flutter/customs/gap.dart";
import "package:serverpod_project_flutter/customs/loading.dart";
import "package:serverpod_project_flutter/customs/text_input.dart";
import "package:serverpod_project_flutter/functions/nav.dart";
import "package:serverpod_project_flutter/main.dart";
import "package:serverpod_project_flutter/pages/home.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final List<CTFHelper> _ctfh =
      List.generate(2, (i) => CTFHelper(labelText: ["Discord ID", "CODE"][i]));

  var _showPass = false;
  var _connect = false;
  var _save = false;
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
                            unawaited(loading(context));
                            await Future.delayed(const Duration(seconds: 1))
                                .then((value) {
                              if (!context.mounted) {
                                return;
                              }
                              back(context);
                            });

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
                      if (x == null) {
                        return;
                      }
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
                              unawaited(loading(context));
                              await Future.delayed(const Duration(seconds: 1))
                                  .then((value) {
                                if (!context.mounted) {
                                  return;
                                }
                                back(context);
                              });
                              if (!context.mounted) {
                                return;
                              }
                              await Navigator.pushReplacement(
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
            ),
          ),
        ),
      ),
    );
  }

  Future<void> callHello(String x) async {
    try {
      await client.xM1haix.hello(x);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    for (final e in _ctfh) {
      e.focusNode.dispose();
      e.controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
