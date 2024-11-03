import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/pages/camera_screen.dart';
import 'package:virtusee_slicing_ui/widgets/custom_dialog.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

class FingerprintScanScreen extends StatefulWidget {
  const FingerprintScanScreen({super.key});

  @override
  _FingerprintScanScreenState createState() => _FingerprintScanScreenState();
}

class _FingerprintScanScreenState extends State<FingerprintScanScreen> {
  double _progress = 0.0;
  bool _isScanning = false;
  bool _isTouching = false;
  bool _isFirstAttempt = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Text(
                "Menggunakan sidik jari",
                style: TextStyles.h2.copyWith(fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTapDown: (_) => _onFingerDown(),
                      onTapUp: (_) => _onFingerUp(),
                      onTapCancel: _onFingerUp,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 220,
                            height: 220,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: PrimaryColor.c5.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                          ),
                          Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: PrimaryColor.c5.withOpacity(0.6),
                                width: 2,
                              ),
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: PrimaryColor.c5.withOpacity(0.9),
                                width: 2,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.fingerprint,
                            color: PrimaryColor.c5
                                .withOpacity(_isTouching ? 1 : 0.5),
                            size: 80,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    if (_isScanning) ...[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: _progress,
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                PrimaryColor.c5),
                            minHeight: 6,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Melakukan pemindaian ${(_progress * 100).toInt()}% ...',
                        style: TextStyles.b1.copyWith(
                            color: NeutralColor.c6,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Letakkan jari Anda di tombol sidik jari dan putar perlahan',
                        style: TextStyles.b1.copyWith(color: NeutralColor.c6),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onFingerDown() {
    setState(() {
      _isTouching = true;
      _isScanning = true;
      _progress = 0.0;
    });
    _startFingerprintScan();
  }

  void _onFingerUp() {
    if (_isTouching) {
      setState(() {
        _isTouching = false;
        _isScanning = false;
        _progress = 0.0;
      });
    }
  }

  void _startFingerprintScan() {
    if (!_isTouching) return;

    Future.delayed(const Duration(milliseconds: 50), () {
      if (!mounted) return;

      setState(() {
        _progress += 0.02;
      });

      if (_progress < 1.0 && _isTouching) {
        _startFingerprintScan();
      } else if (_progress >= 1.0) {
        if (_isFirstAttempt) {
          _showFailureDialog();
        } else {
          _showSuccessDialog();
        }
      }
    });
  }

  void _showFailureDialog() {
    setState(() {
      _isScanning = false;
      _isTouching = false;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomDialog(
        iconData: Icons.error_outline,
        iconColor: Colors.red,
        title: 'Gagal disimpan, coba lagi',
        primaryButtonText: 'Coba lagi',
        onPrimaryButtonPressed: () {
          Navigator.of(context).pop();
          setState(() {
            _isFirstAttempt = false;
            _progress = 0.0;
            _isScanning = false;
          });
        },
      ),
    );
  }

  void _showSuccessDialog() {
    setState(() {
      _isScanning = false;
      _isTouching = false;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomDialog(
        iconData: Icons.check_circle_outline,
        iconColor: Colors.green,
        title: 'Pindai Sidik Jari Berhasil',
        primaryButtonText: 'Lanjutkan',
        onPrimaryButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CameraScreen()),
          );
        },
      ),
    );
  }
}
