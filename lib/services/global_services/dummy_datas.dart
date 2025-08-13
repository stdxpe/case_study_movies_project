import 'package:case_study_movies_project/models/user_model.dart';
import 'package:case_study_movies_project/models/movie_model.dart';
import 'package:case_study_movies_project/models/token_model.dart';

final dummyUser = UserModel(
    id: '245677',
    name: 'Ayça Aydoğan',
    email: 'aycaaydogan@gmail.com',
    photoUrl:
        "https://cdn.cgdream.ai/_next/image?url=https%3A%2F%2Fapi.cgdream.ai%2Frails%2Factive_storage%2Fblobs%2Fredirect%2FeyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMUxSZWc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ%3D%3D--f89b5d55d077057b81849b887ab7a274da76721d%2F482a721f-4c14-4211-8c33-fb9f48a322b0_0.png&w=1080&q=95"
    // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6Zboprv__9RmpvBHkk05IijMoefqt1Z0Egg&s"
    // "https://i.pinimg.com/736x/c1/55/ea/c155ea739260e865a10b62dc1f274dd7.jpg"
    // 'https://img.freepik.com/premium-photo/woman-with-smile-her-face-curly-hair-generative-ai_97167-32428.jpg',
    );

List<TokenModel> dummyTokenList = [
  TokenModel(
    id: 1,
    tokenCount: "330",
    formerTokenCount: "200",
    price: 99.99,
    currency: "₺",
    discountPercent: 10,
    assetPath: 'assets/icons/red.png',
  ),
  TokenModel(
    id: 2,
    tokenCount: "3.375",
    formerTokenCount: "2.000",
    price: 799.99,
    currency: "₺",
    discountPercent: 70,
    assetPath: 'assets/icons/purple.png',
  ),
  TokenModel(
    id: 3,
    tokenCount: "1.350",
    formerTokenCount: "1.000",
    price: 399.99,
    currency: "₺",
    discountPercent: 35,
    assetPath: 'assets/icons/red.png',
  ),
];

List<MovieModel> dummyMoviesList = [
  MovieModel(
    id: '1',
    title: 'Inception',
    description:
        'A mind-bending thriller where dreams collide with reality in a world of shared dreams and layered consciousness.',
    posterUrl:
        'https://i.pinimg.com/736x/d2/e0/3f/d2e03f91eef9e93d94084b054eb8dbe9.jpg',
  ),
  MovieModel(
    id: '2',
    title: 'The Matrix',
    description:
        'What if your world was just a simulation and the truth was hidden behind green code?',
    posterUrl:
        'https://64.media.tumblr.com/4070f9c9cfb82ef9e350bd9e3344a3ff/1b79f15d0c8bd69d-c2/s540x810/ec2abe35ce16c6e7c6368acc7ee3561db8ce455c.gif',
  ),
  MovieModel(
    id: '3',
    title: 'Interstellar',
    description:
        'A journey beyond the stars to save humanity from extinction on a dying Earth.',
    posterUrl:
        'https://www.hollywoodreporter.com/wp-content/uploads/2019/07/interstellar-photofest_still-h_2019.jpg?w=1296&h=730&crop=1',
  ),
  MovieModel(
    id: '4',
    title: 'Kill Bill: Vol. 1',
    description:
        'A former assassin embarks on a relentless quest for vengeance against her ex-colleagues who betrayed her.',
    posterUrl:
        'https://auction.swau.com/cdn/shop/files/vo-MDS00216.jpg?v=1688605549',
  ),
  MovieModel(
    id: '5',
    title: 'Limitless',
    description:
        'A struggling writer unlocks the full potential of his brain with a mysterious pill, altering his life forever.',
    posterUrl: 'https://images.alphacoders.com/678/thumb-1920-678072.jpg',
  ),
];

final newDummyMovie = [
  MovieModel(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    title: 'New Movie ${DateTime.now().millisecondsSinceEpoch.toString()}',
    description: 'Description for new movie',
    posterUrl:
        'https://i.pinimg.com/736x/d2/e0/3f/d2e03f91eef9e93d94084b054eb8dbe9.jpg',
  ),
];
