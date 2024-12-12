import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/constants/app_asset_images.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/routes/app_routes.dart';
import 'package:food_app/views/widgets/animation/animated_circular_border.dart';
import 'package:food_app/views/widgets/switcher.dart';
import 'package:get/get.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              AppAssetImages.onboardingBackground,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 30, right: 30),
                height: 370,
                decoration: const BoxDecoration(
                    color: AppColors.primaryOrange,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "We serve incomparable delicacies",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "All the best restaurants with their top menu waiting for you, they cant’t wait for your order!!",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Switcher(index: 2),
                      const SizedBox(height: 15),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Get.offNamed(AppRoutes.login);
                        },
                        child: AnimatedCircularBorder(
                          content: Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Icon(
                                FontAwesomeIcons.arrowRight,
                                size: 18,
                                color: AppColors.primaryOrange,
                              ),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
