import '../models/product.dart';

class ProductData {
  static List<Product> products = [
    Product(
      name: "Apple",
      image: "assets/images/Apple.jpg",
      price: 40,
      description: "An apple is a fruit, specifically a pome fruit, that grows on an apple tree (Malus domestica). It's typically roundish, with a whitish flesh and a skin that can be red, green, yellow, or pink, depending on the variety. Apples vary in size, shape, acidity, and sugar content, and are widely cultivated for their sweet and delicious flavor. ",
      rating: 4.5,
      reviews: 20,
    ),
    Product(
      name: "Grape",
      image: "assets/images/grape.jpg",
      price: 430,
      description: "Grapes are small ...",
      rating: 4.0,
      reviews: 15,
    ),
    Product(
      name: "Banana",
      image: "assets/images/banana.jpg",
      price: 330,
      description: "Bananas are tropical ...",
      rating: 4.2,
      reviews: 12,
    ),
    Product(
      name: "Peach",
      image: "assets/images/peach.jpg",
      price: 333,
      description: "Peaches are juicy ...",
      rating: 4.3,
      reviews: 18,
    ),
    Product(
      name: "Lemon",
      image: "assets/images/lemon.jpg",
      price: 50,
      description: "Lemons are citrus fruits ...",
      rating: 4.1,
      reviews: 10,
    ),
    Product(
      name: "Watermelon",
      image: "assets/images/watermelon.png",
      price: 400,
      description: "Watermelons are refreshing ...",
      rating: 4.7,
      reviews: 25,
    ),
    Product(
      name: "Kiwi",
      image: "assets/images/Kiwi.png",
      price: 220,
      description: "Kiwis are tangy ...",
      rating: 4.4,
      reviews: 14,
    ),
    Product(
      name: "Blueberry",
      image: "assets/images/Blueberry.png",
      price: 280,
      description: "Blueberries are antioxidant-rich ...",
      rating: 4.6,
      reviews: 30,
    ),
  ];
}
