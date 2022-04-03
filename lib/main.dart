import 'package:flutter/material.dart';

import './result.dart';
import './quiz.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _questions = [
    {
      'question':
          'Who was given the title "Full Metal" in the anime series "Full Metal Alchemist"?',
      'correctAnswer': 'Edward Elric',
      'answers': [
        'Alphonse Elric',
        'Van Hohenheim',
        'Izumi Curtis',
        'Edward Elric'
      ]
    },
    {
      'question':
          'What caused the titular mascot of Yo-Kai Watch" Jibanyan" to become a yokai?',
      'correctAnswer': 'Being run over by a truck',
      'answers': [
        'Ate one too many chocobars',
        'Through a magical ritual',
        'When he put on the harmaki',
        'Being run over by a truck'
      ]
    },
    {
      'question': 'What year did "Attack on Titan" Season 2 begin airing?',
      'correctAnswer': '2017',
      'answers': ['2018', '2019', '2020', '2017']
    },
    {
      'question':
          'In "One Piece" who confirms the existence of the legendary treasure\' One Piece?',
      'correctAnswer': 'Edward "Whitebeard" Newgate',
      'answers': [
        'Former Marine Fleet Admiral Sengoku',
        'Pirate King Gol D Roger',
        'Silvers Rayleigh',
        'Edward "Whitebeard" Newgate'
      ]
    },
    {
      'question': 'In "Highschool DxD"\' Koneko Toujou is from what race?',
      'correctAnswer': 'Nekomata',
      'answers': ['Kitsune', 'Human', 'Kappa', 'Nekomata']
    },
    {
      'question':
          'In "To Love-Ru" who is the first to hear of Yami\'s past from her?',
      'correctAnswer': 'Rito',
      'answers': ['Mikan', 'Lala', 'Haruna', 'Rito']
    },
    {
      'question': 'What animation studio produced "Gurren Lagann"?',
      'correctAnswer': 'Gainax',
      'answers': ['Kyoto Animation', 'Pierrot', 'A-1 Pictures', 'Gainax']
    },
    {
      'question':
          'What was the reason for the banning of episode 35 of the "Pokémon Original Series" Anime?',
      'correctAnswer': 'Gun Usage',
      'answers': ['Flashing Images', 'Jynx', 'Strong Violence', 'Gun Usage']
    },
    {
      'question':
          'In "Love Live: School Idol Project" what pseudonym does Kotori Minami use in her job as a maid?',
      'correctAnswer': 'Minalinsky',
      'answers': ['Stanoytchev', 'Kuznetsov', 'Aqours', 'Minalinsky']
    }
  ];
  int _questionIndex = 0;
  int _score = 0;
  static bool _isDark = false;

  void _answerQuestion(selected, correct) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (selected == correct) {
      _score += 1;
    }
  }

  void _switchTheme() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _questionIndex = 0;
      _questions.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    _questions.shuffle();
    return MaterialApp(
      title: 'Quiz App?',
      theme: ThemeData(
        colorScheme: _isDark
            ? const ColorScheme.dark(
                primary: Colors.teal,
              )
            : const ColorScheme.light(
                primary: Colors.teal,
              ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontSize: 18),
          bodyText1: TextStyle(fontSize: 18),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
          leading: const Icon(Icons.handshake),
          actions: [
            IconButton(
              onPressed: _switchTheme,
              icon: _isDark
                  ? const Icon(Icons.sunny)
                  : const Icon(Icons.nightlight),
            ),
          ],
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                questions: _questions.length,
                score: _score,
                resetQuiz: _resetQuiz,
              ),
      ),
    );
  }
}
