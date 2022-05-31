import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/constants.dart';
import 'package:orilla_fresca/helpers/unit_nums.dart';
import 'package:orilla_fresca/models/category.dart';
import 'package:orilla_fresca/models/poster_content.dart';
import 'package:orilla_fresca/models/subcategory.dart';
import 'package:orilla_fresca/widgets/icon_font_widget.dart';
import '../models/category_part.dart';


class Utils {

  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();

  static List<PosterContent> getPosterContent() {
    return [
      PosterContent(
        message: 'Fresh produce, from the ground to your table',
        image: 'poster1',
      ),
      PosterContent(
        message: 'The best assortment of cheese varieties for your pleasure',
        image: 'poster2',
      ),
      PosterContent(
        message: 'Purchase them from the comfort of your mobile device',
        image: 'poster3',
      ),
    ];
  }

  static String weightUnitToString(WeightUnits unit) {
    switch(unit) {
      case WeightUnits.Kg:
        return 'kg.';
      case WeightUnits.Lb:
        return 'lb.';
      case WeightUnits.Oz:
        return 'oz.';
      default:
        return 'lb.';
    }
  }

  static List<Category> getMockedCategories() {
    return [
      Category(
        name: 'Cheese',
        icon: IconFontHelper.MEATS,
        color: AppColors.MEATS,
        imageName: 'cat1',
        subCategories: [
          SubCategory(
            name: 'Blue cheese',
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
            imageName: 'cat1_1',
            parts: [
              CategoryPart(
                name: 'Brie',
                imageName: 'cat1_1_p1',
                isSelected: false,
              ),
              CategoryPart(
                name: 'Camembert',
                imageName: 'cat1_1_p2',
                isSelected: false,
              ),
              CategoryPart(
                name: 'Gorgonzola',
                imageName: 'cat1_1_p3',
                isSelected: false,
              ),
              CategoryPart(
                name: 'Stilton',
                imageName: 'cat1_1_p4',
                isSelected: false,
              ),
              CategoryPart(
                name: 'Roquefort',
                imageName: 'cat1_1_p5',
                isSelected: false,
              ),
            ],
          ),
          SubCategory(
            name: 'Hard cheese',
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
            imageName: 'cat1_2',
            parts: [],
          ),
          SubCategory(
            name: 'Processed cheese',
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
            imageName: 'cat1_3',
            parts: [],
          ),
          SubCategory(
            name: 'Semi-hard cheese',
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
            imageName: 'cat1_4',
            parts: [],
          ),
          SubCategory(
            name: 'Soft cheese',
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
            imageName: 'cat1_5',
            parts: [],
          ),
          SubCategory(
            name: 'Soft-ripened cheese',
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
            imageName: 'cat1_6',
            parts: [],
          ),
        ],
      ),
      Category(
        name: 'Fruits',
        icon: IconFontHelper.FRUITS,
        color: AppColors.FRUITS,
        imageName: 'cat2',
        subCategories: [
          SubCategory(
            name: 'Kiwi',
            icon: IconFontHelper.FRUITS,
            color: AppColors.FRUITS,
            imageName: 'cat2_1',
            parts: [],
          ),
          SubCategory(
            name: 'Banana',
            icon: IconFontHelper.FRUITS,
            color: AppColors.FRUITS,
            imageName: 'cat2_2',
            parts: [],
          ),
          SubCategory(
            name: 'Grapefruit',
            icon: IconFontHelper.FRUITS,
            color: AppColors.FRUITS,
            imageName: 'cat2_3',
            parts: [],
          ),
          SubCategory(
            name: 'Orange',
            icon: IconFontHelper.FRUITS,
            color: AppColors.FRUITS,
            imageName: 'cat2_4',
            parts: [],
          ),
          SubCategory(
            name: 'Avocado',
            icon: IconFontHelper.FRUITS,
            color: AppColors.FRUITS,
            imageName: 'cat2_5',
            parts: [],
          ),
        ],
      ),
      Category(
        name: 'Vegetables',
        icon: IconFontHelper.VEGS,
        color: AppColors.VEGS,
        imageName: 'cat3',
        subCategories: [
          SubCategory(
            name: 'Sweet pepper',
            icon: IconFontHelper.VEGS,
            color: AppColors.VEGS,
            imageName: 'cat3_1',
            parts: [],
          ),
          SubCategory(
            name: 'Carrot',
            icon: IconFontHelper.VEGS,
            color: AppColors.VEGS,
            imageName: 'cat3_2',
            parts: [],
          ),
          SubCategory(
            name: 'Asparagus',
            icon: IconFontHelper.VEGS,
            color: AppColors.VEGS,
            imageName: 'cat3_3',
            parts: [],
          ),
          SubCategory(
            name: 'Onion',
            icon: IconFontHelper.VEGS,
            color: AppColors.VEGS,
            imageName: 'cat3_4',
            parts: [],
          ),
        ],
      ),
      Category(
        name: 'Seeds',
        icon: IconFontHelper.SEEDS,
        color: AppColors.SEEDS,
        imageName: 'cat4',
        subCategories: [
          SubCategory(
            name: 'Cashew',
            icon: IconFontHelper.SEEDS,
            color: AppColors.SEEDS,
            imageName: 'cat4_1',
            parts: [],
          ),
          SubCategory(
            name: 'Peanut',
            icon: IconFontHelper.SEEDS,
            color: AppColors.SEEDS,
            imageName: 'cat4_2',
            parts: [],
          ),
          SubCategory(
            name: 'Almond',
            icon: IconFontHelper.SEEDS,
            color: AppColors.SEEDS,
            imageName: 'cat4_3',
            parts: [],
          ),
          SubCategory(
            name: 'Pistachios',
            icon: IconFontHelper.SEEDS,
            color: AppColors.SEEDS,
            imageName: 'cat4_4',
            parts: [],
          ),
        ],
      ),
      Category(
        name: 'Pastry',
        icon: IconFontHelper.PASTRIES,
        color: AppColors.PASTRIES,
        imageName: 'cat5',
        subCategories: [
          SubCategory(
            name: 'Nougat',
            icon: IconFontHelper.PASTRIES,
            color: AppColors.PASTRIES,
            imageName: 'cat5_1',
            parts: [],
          ),
          SubCategory(
            name: 'Jam',
            icon: IconFontHelper.PASTRIES,
            color: AppColors.PASTRIES,
            imageName: 'cat5_2',
            parts: [],
          ),
          SubCategory(
            name: 'Marmalade',
            icon: IconFontHelper.PASTRIES,
            color: AppColors.PASTRIES,
            imageName: 'cat5_3',
            parts: [],
          ),
          SubCategory(
            name: 'Cookie',
            icon: IconFontHelper.PASTRIES,
            color: AppColors.PASTRIES,
            imageName: 'cat5_4',
            parts: [],
          ),
        ],
      ),
      Category(
        name: 'Spices',
        icon: IconFontHelper.SPICES,
        color: AppColors.SPICES,
        imageName: 'cat6',
        subCategories: [
          SubCategory(
            name: 'Mint',
            icon: IconFontHelper.SPICES,
            color: AppColors.SPICES,
            imageName: 'cat6_1',
            parts: [],
          ),
          SubCategory(
            name: 'Paprika',
            icon: IconFontHelper.SPICES,
            color: AppColors.SPICES,
            imageName: 'cat6_2',
            parts: [],
          ),
          SubCategory(
            name: 'Peppercorns',
            icon: IconFontHelper.SPICES,
            color: AppColors.SPICES,
            imageName: 'cat6_3',
            parts: [],
          ),
          SubCategory(
            name: 'Cinnamon',
            icon: IconFontHelper.SPICES,
            color: AppColors.SPICES,
            imageName: 'cat6_4',
            parts: [],
          ),
        ],
      ),
    ];
  }
}