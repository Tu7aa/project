class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Nearby restaurants',
    image: 'assets/images/imageOne.png',
  ),
  OnBoarding(
    title: 'Select the Favorites Menu',
    image: 'assets/images/imageTwo.png',
  ),
  OnBoarding(
    title: 'Good food at a cheap price',
    image: 'assets/images/imageThree.png',
  ),
];
