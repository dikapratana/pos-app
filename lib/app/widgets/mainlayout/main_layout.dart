import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainLayout extends StatelessWidget {
  final Color background;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  // Customizable per page
  final Color statusBarColor;
  final Brightness? statusBarIconBrightness; // auto jika null
  final Color navigationBarColor;
  final Brightness navigationBarIconBrightness;

  const MainLayout({
    super.key,
    this.background = Colors.white,
    required this.body,
    this.appBar,
    this.drawer,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.statusBarColor = Colors.white,
    this.statusBarIconBrightness,
    this.navigationBarColor = Colors.white,
    this.navigationBarIconBrightness = Brightness.dark,
  });

  @override
  Widget build(BuildContext context) {
    // Tentukan brightness icon otomatis jika tidak ditentukan
    final Brightness iconBrightness =
        statusBarIconBrightness ??
        ((statusBarColor.computeLuminance() > 0.5)
            ? Brightness.dark
            : Brightness.light);

    // Gaya sistem (status bar & navigation bar)
    final systemStyle = SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: iconBrightness,
      statusBarBrightness: iconBrightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
      systemNavigationBarColor: navigationBarColor,
      systemNavigationBarIconBrightness: navigationBarIconBrightness,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemStyle,
      child: Scaffold(
        backgroundColor: background,
        appBar: appBar == null
            ? null
            : PreferredSize(
                preferredSize: appBar!.preferredSize,
                child: SafeArea(top: true, bottom: false, child: appBar!),
              ),
        drawer: drawer,
        body: SafeArea(
          top: appBar == null, // only add top padding if no AppBar
          bottom: true,
          child: body,
        ),
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
