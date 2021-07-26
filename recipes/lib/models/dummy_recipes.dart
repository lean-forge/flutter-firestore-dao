import 'package:recipes/models/index.dart';

final author = Author(name: 'Gordon Ramsey', gender: Gender.Male);
final List<Recipe> DUMMY_RECIPES = [
  Recipe(
    title: 'Sun-Dried Tomato and Chickpea Sliders',
    author: author,
    totalTime: 35,
    yields: '8 sliders',
    imageUrl:
        'https://www.forksoverknives.com/wp-content/uploads/sun-dried-chickpea-sliders-wordpress.jpg',
    ingredients: [
      "½ cup chopped onion",
      "½ cup coarsely chopped fresh mushrooms",
      "½ cup coarsely chopped zucchini",
      "1 clove garlic, minced",
      "¾ cup no-salt-added chickpeas, rinsed and drained, and liquid (aquafaba) reserved",
      "¼ cup chopped sun-dried tomatoes (not oil packed)",
      "1 teaspoon Italian seasoning, crushed",
      "½ teaspoon lemon zest",
      "Sea salt and freshly ground black pepper, to taste",
      "¼ cup cornmeal",
      "1 large zucchini, cut lengthwise into ½-inch-thick planks",
      "2 tablespoons balsamic vinegar",
      "8 slices roma tomato"
    ],
    instructions:
        "In a large skillet cook the first four ingredients (through garlic) over medium 3 to 4 minutes, stirring occasionally and adding water, 1 to 2 Tbsp. at a time, as needed to prevent sticking. Place in a food processor with the chickpeas, sun-dried tomatoes, Italian seasoning, and lemon zest. Cover and pulse until chunky but not pureed. Add 1 to 2 Tbsp. of the aquafaba if the mixture seems dry or isn’t sticking together. Mixture should be moist but not wet. Season with salt and pepper.\nWith wet hands, shape bean mixture into eight patties. Chill at least 20 minutes. Lightly dredge patties in cornmeal to coat.\nHeat a grill pan over medium-high. Cook sliders 8 to 10 minutes or until browned and heated through, turning once. Brush zucchini planks with some of the balsamic vinegar. Cook in grill pan 4 to 6 minutes or until crisp-tender and grill marks appear, turning once. Cut planks into 16 pieces for “buns.” Place sliders and tomato slices between plank pieces. Drizzle with any remaining vinegar.",
    ratings: 5.0,
  ),
  Recipe(
    title: 'Blueberry-Banana Wraps',
    author: author,
    totalTime: 15,
    yields: "4 wraps",
    imageUrl:
        "https://www.forksoverknives.com/wp-content/uploads/Blueberry-wraps-wordpress.jpg",
    ingredients: [
      "1 cup fresh blueberries",
      "½ cup chopped celery",
      "¼ cup crushed walnuts or peanuts",
      "4 or 5 fresh mint leaves, finely chopped",
      "4 8-inch whole wheat tortillas",
      "2 cups fresh baby spinach",
      "4 ripe bananas, peeled"
    ],
    instructions:
        "In a bowl stir together blueberries, celery, walnuts, and mint.\nFor each wrap, in a skillet heat a tortilla over medium 30 seconds per side. Transfer warm tortilla to a cutting board. Arrange ½ cup spinach on tortilla. Top with a banana; mash banana with a fork. Top with one-fourth of the blueberry mixture. Roll up tortilla, folding in sides. Place wrap, folded sides down, on a platter. Repeat to make four wraps.",
    ratings: 5.0,
  )
];
