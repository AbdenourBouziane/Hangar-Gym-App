import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRcodePage extends StatelessWidget {
  const QRcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          Assets.images.frameLogo,
          height: 50,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        backgroundColor: AppColors.mainBlue,
      ),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.images.background,
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.5,
                ),
                gradient: const LinearGradient(
                  colors: [AppColors.mainBlue, AppColors.mainRed],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Center(
              child: Container(
                height: 350,
                width: 350,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: "open the door",
                      version: QrVersions.auto,
                      size: 200,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Scan QR Code',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
