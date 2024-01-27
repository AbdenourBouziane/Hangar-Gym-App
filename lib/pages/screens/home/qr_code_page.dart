import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/navigation_controller.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/utils/constant.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QRcodePage extends StatefulWidget {
  QRcodePage({super.key});
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  State<QRcodePage> createState() => _QRcodePageState();
}

class _QRcodePageState extends State<QRcodePage> {
  late User? currentUser;

  @override
  void initState() {
    super.initState();
    fetchCurrentUser();
  }

  Future<void> fetchCurrentUser() async {
    final user = client.auth.currentUser;
    setState(() {
      currentUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
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
      body: GradienBackground(
        child: Center(
          child: currentUser != null
              ? _buildQRCode(currentUser!.id)
              : _buildLoginButton(),
        ),
      ),
    );
  }

  Widget _buildQRCode(String userId) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: QrImageView(
            data: userId,
            version: QrVersions.auto,
            size: 250,
            backgroundColor: AppColors.white,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'Scan your QR code',
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Lato',
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 60),
        const Text(
          'Coming soon ...',
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Lato',
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                AppColors.blueSecondary,
              ),
            ),
            onPressed: () {
              widget.navigationController.naviagteToLoginPage();
            },
            child: const Text(
              'Login to get your QR Code',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato',
                color: AppColors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        const Text(
          'Coming soon',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Lato',
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
