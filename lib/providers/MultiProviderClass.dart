import 'package:flutter/material.dart';
import 'package:gestion_livraison/controllers/CommandeController.dart';
import 'package:gestion_livraison/screens/views/CommandePage.dart';
import 'package:provider/provider.dart';

class MultiPrividerClass extends StatefulWidget {
  const MultiPrividerClass({super.key});

  @override
  State<MultiPrividerClass> createState() => _MultiPrividerClassState();
}

class _MultiPrividerClassState extends State<MultiPrividerClass> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CommandeProvider()),
      ],
      child: const MaterialApp(
        title: 'Your App',
        home: CommandeListScreen(),
      ),
    );
  }
}
