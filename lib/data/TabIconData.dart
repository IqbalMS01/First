import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabIconData {
  String name;
  String imagePath;
  Icon imageIcon;
  String selectedImagePath;
  Icon selectedImageIcon;
  bool isSelected;
  int index;
  AnimationController animationController;

  TabIconData({
    this.name = '',
    this.imagePath = '',
    this.imageIcon,
    this.index = 0,
    this.selectedImagePath = "",
    this.selectedImageIcon,
    this.isSelected = false,
    this.animationController,
  });

  static List<TabIconData> tabIconsList = [
    TabIconData(
      name: 'Marketplace',
      imagePath: 'assets/images/tab_1.png',
      selectedImagePath: 'assets/images/tab_1s.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      name: 'Portofolio',
      imagePath: 'assets/images/tab_2.png',
      selectedImagePath: 'assets/images/tab_2s.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      name: 'Akun',
      imagePath: 'assets/images/tab_3.png',
      selectedImagePath: 'assets/images/tab_3s.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      name: 'Profile',
      imagePath: 'assets/images/tab_4.png',
      selectedImagePath: 'assets/images/tab_4s.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
