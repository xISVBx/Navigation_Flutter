import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view_http_navigated/pages/home_page.dart';
import 'package:list_view_http_navigated/pages/selection_page.dart';
import 'package:list_view_http_navigated/provider/list_provider.dart';


import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => ListProvider())],
        child: GetMaterialApp(
          title: 'Material App',
          initialRoute: '/',
          routes: {
            '/': (_) => const HomePage(),
            '/selection':(_) => const SelectionPage()
            },
        ));
  }
}
