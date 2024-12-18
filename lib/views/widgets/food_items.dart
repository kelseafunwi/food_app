import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/constants/app_colors.dart';

class FoodItems extends StatelessWidget {
  final String category;

  const FoodItems({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: []),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            'https://erafricanonlinestore.com/cdn/shop/articles/86E207EF-1F88-4281-92F1-E08AD28C2E76_1200x.webp?v=1681512131',
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            right: 10,
                            top: 10,
                            child: GestureDetector(
                                child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(5),
                              child: const Center(
                                  child: Icon(
                                FontAwesomeIcons.heart,
                                color: AppColors.errorFocusRed,
                                size: 17,
                              )),
                            )))
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Fufu and Eru",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.neutral100),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.primaryOrange,
                            ),
                            SizedBox(width: 3),
                            Text(
                              "4.9",
                              style: TextStyle(
                                color: AppColors.neutral100,
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.primaryOrange,
                            ),
                            SizedBox(width: 3),
                            Text(
                              "4.9",
                              style: TextStyle(
                                color: AppColors.neutral100,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "CFA 1500",
                      style: TextStyle(
                          color: AppColors.primaryOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                )),
          );
        });
  }
}
