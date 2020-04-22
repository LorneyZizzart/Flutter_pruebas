import 'package:flutter/material.dart';
import 'package:header_cuadrado/src/theme/theme.dart';
import 'package:header_cuadrado/src/widgets/header_widget.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      body: HearderCurvo(color: appTheme.accentColor,)
    );
  }
}