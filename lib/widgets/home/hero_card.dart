import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class HeroCard extends StatelessWidget {
  final VoidCallback onContinueLearning;
  final VoidCallback onStartCalculating;

  const HeroCard({
    super.key,
    required this.onContinueLearning,
    required this.onStartCalculating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.darkGreen, width: 3.5),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: -10,
                  bottom: -20,
                  child: Image.asset('assets/images/3d_book.png', width: 200),
                ),

                Positioned(
                  top: 18,
                  right: -15,
                  child: Image.asset('assets/images/3d_coin.png', width: 45),
                ),

                Positioned(
                  top: 80,
                  left: -20,
                  child: Transform.flip(
                    flipX: true,
                    child: Image.asset('assets/images/3d_coin.png', width: 45),
                  ),
                ),

                Positioned(
                  bottom: -15,
                  left: 180,
                  child: Image.asset('assets/images/3d_coin.png', width: 50),
                ),

                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hai Pembelajar Faraidh,\nAyo Lanjut Belajar!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.only(left: 150),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.gold,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  shadowColor: Colors.black,
                                  elevation: 4,
                                ),
                                onPressed: onContinueLearning,
                                child: const Text(
                                  "Lanjut Belajar",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.lime,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  shadowColor: Colors.black,
                                  elevation: 4,
                                ),
                                onPressed: onStartCalculating,
                                child: const Text(
                                  "Kalkulator Waris",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
