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
      'Embark on a celestial adventure into the vast unknown. Unravel the mysteries of the universe, from the captivating formation of stars and galaxies to the mind-boggling black holes and the quest for extraterrestrial life. Explore the wonders of our solar system, delve into the secrets of space exploration, and contemplate the profound questions about the origin, evolution, and future of our cosmos. This theme will ignite your curiosity and inspire you to ponder the grand scale of existence.',
      'assets/images/number-one.png',
      'assets/data/theme1.json',
      'assets/images/theme1.png'),
  Category(
      1,
      'Theme 2: Unraveling the Mysteries of Life',
      'Immerse yourself in the captivating world of biology, where you\'ll discover the intricate mechanisms of life, from the microscopic workings of cells to the complex interactions of ecosystems. Explore the diversity of living organisms, from the simplest bacteria to the most complex animals, and unravel the fascinating processes of evolution and adaptation. Investigate the delicate balance of the natural world and learn about the challenges and opportunities we face in preserving our planet for future generations.',
      'assets/images/number-two.png',
      'assets/data/theme2.json',
      'assets/images/theme2.jpg'),
  Category(
      2,
      'Theme 3: Decoding the Language of Technology',
      'Embark on a journey through the ever-evolving realm of technology. Discover the remarkable ways technology is shaping our lives, from the devices we use daily to the groundbreaking innovations that are changing the world. Explore the fascinating history of technological advancements, delve into the intricate world of coding and programming, and understand the potential and challenges of artificial intelligence, robotics, and the digital revolution. This theme will equip you with the knowledge and skills to navigate the ever-changing landscape of technology and contribute to its future development.',
      'assets/images/number-three.png',
      'assets/data/theme3.json',
      'assets/images/theme3.jpg'),
  Category(
      3,
      'Theme 4: Navigating the Labyrinth of History',
      'Delve into the captivating chronicles of the past, where you\'ll explore the events and personalities that shaped the world we know today. Uncover the stories of ancient civilizations, momentous wars and revolutions, and the rise and fall of empires. Analyze the impact of historical figures and movements, learn from the successes and failures of the past, and gain valuable insights into the complexities of human society. This theme will broaden your understanding of the present and equip you to navigate the future with a deeper perspective.',
      'assets/images/number-four.png',
      'assets/data/theme4.json',
      'assets/images/theme4.jpg'),
  Category(
      4,
      'Theme 5: Unveiling the Wonders of Art and Culture',
      'Immerse yourself in the diverse expressions of human creativity through art and culture. Explore the captivating world of painting, sculpture, music, literature, and dance, and discover how these artistic forms reflect the human experience and inspire us to connect with ourselves and others. Delve into the rich tapestry of cultures around the world, appreciate the beauty and significance of traditional art forms, and understand the power of artistic expression to challenge, provoke, and inspire.',
      'assets/images/number-five.png',
      'assets/data/theme5.json',
      'assets/images/theme5.jpg'),
  Category(
      5,
      "Chuyên đề 1. Lịch sử Lâm Đồng giai đoạn 1893 – 1945s",
      "Mô tả của chuyên đề 1",
      'assets/images/star.png',
      'assets/data/chuyende1.json',
      'assets/images/special.jpg'),
];
