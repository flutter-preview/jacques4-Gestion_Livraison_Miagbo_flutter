import 'package:flutter/material.dart';
import 'package:gestion_livraison/controllers/LivraisonController.dart';
import 'package:gestion_livraison/screens/views/LivraisonPage.dart';
import 'package:provider/provider.dart';

class LivraisonMultiProvider extends StatefulWidget {
  const LivraisonMultiProvider({super.key});

  @override
  State<LivraisonMultiProvider> createState() => _LivraisonMultiProviderState();
}

class _LivraisonMultiProviderState extends State<LivraisonMultiProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LivraisonProvider()),
      ],
      child: const MaterialApp(
        title: 'Your App',
        home: LivraisonListScreen(),
      ),
    );
  }
}
