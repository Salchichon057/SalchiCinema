import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDbKey = dotenv.env['THE_MOVIEDB_API_KEY'] ?? 'API KEY not found!';
}