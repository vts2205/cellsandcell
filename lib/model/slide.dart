class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/introimg1.png',
    title: 'Welcome to Cell\'s and Cell',
    description: '',
  ),
  Slide(
    imageUrl: 'assets/images/introimg2.png',
    title: 'Join with Us',
    description: 'Let\'s join together to become digitalized',
  ),
  Slide(
    imageUrl: 'assets/images/introimg3.png',
    title: 'Earn Money',
    description: 'Make money digitally by buying accessories from us ',
  ),
  Slide(
    imageUrl: 'assets/images/introimg4.png',
    title: 'Share Money',
    description:
        'Share your money to your friends and buy a product using that',
  ),
];
