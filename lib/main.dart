import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hash_mufattish/app_localizations.dart';
import 'package:hash_mufattish/equipment_info.dart';
import 'package:hash_mufattish/l10n.dart';
import 'package:hash_mufattish/local_Provider.dart';
import 'package:hash_mufattish/login.dart';
import 'package:hash_mufattish/new_inspection.dart';
import 'package:hash_mufattish/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      locale: provider.locale,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (deviceLocale != null &&
              deviceLocale.languageCode == locale.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
