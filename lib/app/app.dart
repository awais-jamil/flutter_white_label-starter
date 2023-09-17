import 'package:drive_share/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class DriveShareApp extends StatelessWidget {
  const DriveShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AppRouter(),
        ),
      ],
      child: const LocalizedAppWidget(),
    );
  }
}

class LocalizedAppWidget extends StatelessWidget {
  const LocalizedAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: kSupportedLocale,
      path: kLocaleAssetPath,
      fallbackLocale: kFallBackLocale,
      startLocale: kFallBackLocale,
      child: Builder(
        builder: (ctx) {
          final router = context.read<AppRouter>();
          return GestureDetector(
            onTap: () => ctx.unfocus(),
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routeInformationProvider: router.routeInformationProvider,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              localizationsDelegates: ctx.localizationDelegates,
              supportedLocales: ctx.supportedLocales,
              locale: ctx.locale,
              title: LocaleStrings.appTitle,
              theme: AppTheme().lightTheme,
              darkTheme: AppTheme().darkTheme,
            ),
          );
        },
      ),
    );
  }
}
