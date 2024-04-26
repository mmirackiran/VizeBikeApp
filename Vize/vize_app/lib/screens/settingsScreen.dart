import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vizeapp/core/localization.dart';
import 'package:vizeapp/theme/theme_provider.dart';
import '../bloc/cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late ClientCubit clientCubit;

  bool isSwitched = false;
  bool isSwitchedLanguage = false;
  String camResult = "";
  String locationResult = "";

  MaterialStateProperty<Color?> overlayColor =
      MaterialStateColor.resolveWith((states) => Colors.grey);

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
    _loadData();
  }

  //bool loader
  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSwitched = prefs.getBool("isswitched") ?? false;
      isSwitchedLanguage = prefs.getBool("isswitchedlang") ?? false;
    });
  }

  void _saveBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isswitched", isSwitched);
    await prefs.setBool("isswitchedlang", isSwitchedLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context).getTranslate("drawer_settings")),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: BlocBuilder<ClientCubit, ClientState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 55),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .getTranslate("settings_theme"),
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Light"),
                            Switch(
                              activeTrackColor:
                                  Theme.of(context).colorScheme.secondary,
                              activeColor:
                                  const Color.fromARGB(255, 218, 221, 211),
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .toggleTheme();
                                  _saveBool();
                                });
                              },
                            ),
                            const Text("Dark"),
                          ],
                        ),
                        const Gap(25),
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .getTranslate("settings_language"),
                              style: TextStyle(fontSize: 25),
                            ),
                            const Gap(5),
                            Text(clientCubit.state.language),
                          ],
                        ),
                        const Gap(10),
                        Column(
                          children: [
                            Row(
                              children: [
                                const Text("EN"),
                                Switch(
                                  activeTrackColor: Colors.white,
                                  activeColor: Color(0xFFEF6C00),
                                  value: isSwitchedLanguage,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitchedLanguage = value;
                                      if (isSwitchedLanguage) {
                                        clientCubit.changeLang(language: "tr");
                                      } else {
                                        clientCubit.changeLang(language: "en");
                                      }
                                      _saveBool();
                                    });
                                  },
                                ),
                                const Text("TR"),
                              ],
                            ),
                          ],
                        ),
                        const Gap(50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
