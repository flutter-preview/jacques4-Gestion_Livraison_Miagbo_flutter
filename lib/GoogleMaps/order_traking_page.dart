import 'package:flutter/material.dart';
import 'package:gestion_livraison/models/Livraison.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingPage extends StatelessWidget {
  Livraison livraison;
  OrderTrackingPage({super.key, required this.livraison});

  static LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static LatLng destination = LatLng(37.33429383, -122.0660055);

  @override
  Widget build(BuildContext context) {
    var latFournisseur =
        livraison.commande['produit']['fournisseur']['latitude'];
    var longFournisseur =
        livraison.commande['produit']['fournisseur']['latitude'];
    var latClient = livraison.commande['client']['latitude'];
    var longClient = livraison.commande['client']['longitude'];

    var debut = LatLng(latFournisseur, longFournisseur);
    var fin = LatLng(latClient, longClient);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text(
          "Livraison Miagbo",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: sourceLocation,
          zoom: 13.5,
        ),
        markers: {
          Marker(
              markerId: const MarkerId("Source"),
              position: sourceLocation,
              infoWindow: const InfoWindow(
                  title: 'Le Vendeur', snippet: 'Fournisseur')),
          Marker(
              markerId: const MarkerId("Destionation"),
              position: destination,
              infoWindow: const InfoWindow(
                title: 'Le Client',
              )),
        },
      ),
    );
  }
}
