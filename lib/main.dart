import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_resto_app/app/core/providers/app_providers.dart';
import 'package:pos_resto_app/app/core/routers/app_router.dart';
import 'package:pos_resto_app/app/core/theme/app_colors.dart';

import 'app/core/configs/services/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProviders.list,
      child: MaterialApp.router(
        title: 'Resto ABCD',
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary1),
        ),
        routerConfig: AppRouter().router,
      ),
    );
  }
}
