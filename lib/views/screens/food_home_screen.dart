import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/views/widgets/category_tabs.dart';
import 'package:food_app/views/widgets/food_items.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({super.key});

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 230,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/food_background.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Your Location",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      FontAwesomeIcons.chevronDown,
                      color: Colors.white,
                      size: 13,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const HeroIcon(
                      HeroIcons.mapPin,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "New York City",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Provide the best\nfood for you",
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: AppColors.neutral10)),
                )
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Find by Category",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: AppColors.neutral100,
                                  fontWeight: FontWeight.w600)),
                        ),
                        InkWell(
                          onTap: seeAll,
                          child: const Text(
                            "See All",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColors.primaryOrange,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    TabBar(
                      labelColor: Colors.white,
                      tabs: categoryTabs,
                      dividerColor: Colors.transparent,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),

                    // Content for each tab
                    const Expanded(
                      child: TabBarView(
                        children: [
                          FoodItems(
                            category: "food",
                          ),
                          FoodItems(
                            category: "eru",
                          ),
                          FoodItems(
                            category: "drinks",
                          ),
                          FoodItems(
                            category: "drinks",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void seeAll() {
    if (kDebugMode) {
      print("See all button clicked");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
