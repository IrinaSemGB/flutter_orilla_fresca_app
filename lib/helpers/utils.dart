import 'package:orilla_fresca/helpers/constants.dart';
import 'package:orilla_fresca/models/category.dart';
import 'package:orilla_fresca/widgets/icon_font_widget.dart';


class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
        name: 'Cheese',
        icon: IconFontHelper.MEATS,
        color: AppColors.MEATS,
        imageName: 'cat1',
        subCategories: [],
      ),
      Category(
        name: 'Fruits',
        icon: IconFontHelper.FRUITS,
        color: AppColors.FRUITS,
        imageName: 'cat2',
        subCategories: [],
      ),
      Category(
        name: 'Vegetables',
        icon: IconFontHelper.VEGS,
        color: AppColors.VEGS,
        imageName: 'cat3',
        subCategories: [],
      ),
      Category(
        name: 'Seeds',
        icon: IconFontHelper.SEEDS,
        color: AppColors.SEEDS,
        imageName: 'cat4',
        subCategories: [],
      ),
      Category(
        name: 'Pastry',
        icon: IconFontHelper.PASTRIES,
        color: AppColors.PASTRIES,
        imageName: 'cat5',
        subCategories: [],
      ),
      Category(
        name: 'Spices',
        icon: IconFontHelper.SPICES,
        color: AppColors.SPICES,
        imageName: 'cat6',
        subCategories: [],
      ),
    ];
  }
}