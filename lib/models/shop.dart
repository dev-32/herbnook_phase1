import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'plant.dart';

var uuid = Uuid().v1();

class HerbNook extends ChangeNotifier {
  final List<Plant> _shop = [
    Plant(
        name: "Tusli",
        price: "251",
        imagePath: "assets/images/tulsi.png",
        description:
            'Tulsi, also known as Holy Basil, is a sacred and aromatic herb native to India. It has small green leaves with a peppery, sweet scent and is revered in Hindu culture. Tulsi is valued for its potential health benefits, including adaptogenic properties, antioxidants, and anti-inflammatory effects. It is commonly used in Ayurvedic medicine to address various health concerns, from stress management to respiratory and digestive issues.'),
    Plant(
        name: "Mint",
        price: "451",
        imagePath: "assets/images/mint.png",
        description:
            'Mint is a fragrant herb with small, green leaves and a refreshing flavor. It\'s widely used in culinary dishes, teas, and as a garnish. Mint is known for its potential health benefits, including digestive aid, headache relief, and soothing properties. It\'s a versatile herb that adds a burst of flavor and aroma to many recipes, and it\'s also enjoyed in various forms, such as peppermint and spearmint.'),
    Plant(
        name: "Lemongrass",
        price: "251",
        imagePath: "assets/images/lemongrass.png",
        description:
            'Lemongrass is a tall, aromatic herb with long, slender green leaves and a lemony scent. It\'s native to tropical regions and is widely used in culinary dishes, teas, and as a fragrant addition to various cuisines. Lemongrass is valued for its potential health benefits, including digestion aid, stress reduction, and anti-inflammatory properties. It adds a unique citrusy flavor and aroma to recipes and is a key ingredient in many Asian and Caribbean dishes, as well as herbal teas and essential oils.'),
    Plant(
        name: "Curry",
        price: "151",
        imagePath: "assets/images/curry.png",
        description:
            'Curry is a versatile term used to describe a wide range of dishes and spice blends originating from South Asia. These dishes typically feature a mixture of spices and herbs, often including turmeric, cumin, coriander, ginger, and garlic, among others. Curries can be made with various ingredients, such as meats, vegetables, legumes, or seafood, and can vary greatly in flavor, spiciness, and consistency depending on regional and personal preferences. Curries are known for their rich, complex flavors and are a staple in Indian, Thai, and other South Asian cuisines. They are typically served with rice, bread, or noodles.'),
    Plant(
        name: "Thyme",
        price: "851",
        imagePath: "assets/images/thyme.png",
        description:
            'Thyme is a fragrant herb with small, gray-green leaves and a distinct, earthy flavor. It belongs to the mint family and is used as a seasoning in various cuisines worldwide. Thyme is particularly popular in Mediterranean and European cooking, where it enhances the flavor of dishes like roasted meats, stews, soups, and vegetables. It also pairs well with other herbs like rosemary and sage. Thyme is known for its potential health benefits, including antimicrobial properties, and it has been used in traditional medicine for its soothing and respiratory benefits. It\'s available both fresh and dried and is a versatile herb widely used in culinary applications.'),
  ];

  final List<Plant> _userCart = [];
  List<Plant> _oCart = [];
  List<Plant> get shop => _shop;
  List<Plant> get cart => _userCart;
  List<Plant> get ocart => _oCart;

  void addToCart(Plant plant) {
    _userCart.add(plant);
    notifyListeners();
  }

  void removeFromCart(Plant plant) {
    _userCart.remove(plant);
    notifyListeners();
  }

  void addToOCart() {
    _oCart = [..._userCart];
    for (int i = 0; i < _oCart.length; i++) {
      print(_oCart[i].name);
      print(_oCart[i].price);
    }
    notifyListeners();
  }
}
