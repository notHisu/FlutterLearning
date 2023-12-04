class Category {
  final int id;
  final String name;
  final String description;
  final String imagePath;
  final String questionPath;
  final String displayPicturePath;
  Category(this.id, this.name, this.description, this.imagePath,
      this.questionPath, this.displayPicturePath);
}

final List<Category> categories = [
  Category(
      0,
      'Theme 1: Exploration of the Cosmos',
      'Put something here',
      'lib/images/number-one.png',
      'lib/data/theme1.json',
      'lib/images/theme1.png'),
  Category(
      1,
      'Theme 2: Unraveling the Mysteries of Life',
      'Venture into the fascinating world of biology and discover the intricate mechanisms of life.',
      'lib/images/number-two.png',
      'lib/data/theme2.json',
      'lib/images/theme2.jpg'),
  Category(
      2,
      'Theme 3: Decoding the Language of Technology',
      'Embark on a journey through the realm of technology, exploring its impact on our lives and the world around us.',
      'lib/images/number-three.png',
      'lib/data/theme3.json',
      'lib/images/theme3.jpg'),
  Category(
      3,
      'Theme 4: Navigating the Labyrinth of History',
      'Delve into the chronicles of the past, unraveling the events that shaped our world and the people who inhabited it.',
      'lib/images/number-four.png',
      'lib/data/theme4.json',
      'lib/images/theme4.jpg'),
  Category(
      4,
      'Theme 5: Unveiling the Wonders of Art and Culture',
      'Immerse yourself in the diverse expressions of human creativity, exploring the power of art and culture to inspire and transform.',
      'lib/images/number-five.png',
      'lib/data/theme5.json',
      'lib/images/theme5.jpg'),
];
