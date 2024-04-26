import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vizeapp/bloc/cubit.dart';
import 'package:vizeapp/core/localization.dart';
import 'package:vizeapp/models/shop.dart';
import '../core/routes.dart';
import 'theme/theme_provider.dart';

void main() async {
  await Hive.initFlutter();

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ClientCubit(
            ClientState(language: "en"),
          ),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => Cart(),
        builder: (context, child) => MaterialApp.router(
          routerConfig: routes,
          title: "Bike App",
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).themeData,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('tr', 'TR'),
          ],
          locale: Locale(context.watch<ClientCubit>().state.language),
        ),
      ),
    );
  }
}
