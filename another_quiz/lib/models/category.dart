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
      'assets/images/number-one.png',
      'assets/data/theme1.json',
      'assets/images/theme1.png'),
  Category(
      1,
      'Theme 2: Unraveling the Mysteries of Life',
      'Venture into the fascinating world of biology and discover the intricate mechanisms of life.',
      'assets/images/number-two.png',
      'assets/data/theme2.json',
      'assets/images/theme2.jpg'),
  Category(
      2,
      'Theme 3: Decoding the Language of Technology',
      'Embark on a journey through the realm of technology, exploring its impact on our lives and the world around us.',
      'assets/images/number-three.png',
      'assets/data/theme3.json',
      'assets/images/theme3.jpg'),
  Category(
      3,
      'Theme 4: Navigating the Labyrinth of History',
      'Delve into the chronicles of the past, unraveling the events that shaped our world and the people who inhabited it.',
      'assets/images/number-four.png',
      'assets/data/theme4.json',
      'assets/images/theme4.jpg'),
  Category(
      4,
      'Theme 5: Unveiling the Wonders of Art and Culture',
      'Immerse yourself in the diverse expressions of human creativity, exploring the power of art and culture to inspire and transform.',
      'assets/images/number-five.png',
      'assets/data/theme5.json',
      'assets/images/theme5.jpg'),
];
