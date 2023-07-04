import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  AudioPlayer audioPlayer = AudioPlayer();

  var audioUrl = AssetSource("sounds/sound.mp3");
  // String soundPath = 'assets/sounds/Barcode-scanner-beep-sound.mp3';
  // Uri soundPath = Uri.parse('assets/sounds/Barcode-scanner-beep-sound.mp3'); // Chemin du fichier audio

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text(
          "Livraison Miagbo",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                  borderRadius: 10,
                  borderColor: Colors.green,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300),
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? //Text('Qr Code: ${describeEnum(result!.format)}   Donnee: ${result!.code}')
                  Text('Donnee: ${result!.code}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                  : const Text(
                      'Scanner',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        _playScanCompleteSound();
        // Vérifier si le résultat n'est pas nul et jouer le son
        if (result != null) {
          _playScanCompleteSound();
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> _playScanCompleteSound() async {
    await audioPlayer.play(audioUrl);
    print('Scan complete sound is playing');
  }
}
