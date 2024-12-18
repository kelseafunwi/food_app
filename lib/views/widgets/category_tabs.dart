import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/constants/app_colors.dart';

var categoryTabs = [
  Tab(
      child: Container(
          padding: const EdgeInsets.all(1),
          decoration: const BoxDecoration(
              color: AppColors.primaryOrange,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Column(
            children: [
              Icon(
                FontAwesomeIcons.burger,
                color: Colors.white,
              ),
              Text(
                "Veges",
                style: TextStyle(fontSize: 12),
              )
            ],
          ))),
  Tab(
      child: Container(
          padding: const EdgeInsets.all(1),
          decoration: const BoxDecoration(
              color: AppColors.primaryOrange,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Column(
            children: [
              Icon(
                FontAwesomeIcons.burger,
                color: Colors.white,
              ),
              Text(
                "Veges",
                style: TextStyle(fontSize: 12),
              )
            ],
          ))),
  Tab(
      child: Container(
          padding: const EdgeInsets.all(1),
          decoration: const BoxDecoration(
              color: AppColors.primaryOrange,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Column(
            children: [
              Icon(
                FontAwesomeIcons.burger,
                color: Colors.white,
              ),
              Text(
                "Veges",
                style: TextStyle(fontSize: 12),
              )
            ],
          ))),
  Tab(
      child: Container(
          padding: const EdgeInsets.all(1),
          decoration: const BoxDecoration(
              color: AppColors.primaryOrange,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Column(
            children: [
              Icon(
                FontAwesomeIcons.burger,
                color: Colors.white,
              ),
              Text(
                "Veges",
                style: TextStyle(fontSize: 12),
              )
            ],
          ))),
];
