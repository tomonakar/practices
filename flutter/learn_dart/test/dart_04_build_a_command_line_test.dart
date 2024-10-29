import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }

void main() {
  while (true) {
    final rng = Random();
    stdout.write('Rock, Paper, Scissors(r/p/s):');
    final input = stdin.readLineSync();

    if (input == 'r' || input == 'p' || input == 's') {
      Move playMove;
      if (input == 'r')
        playMove = Move.rock;
      else if (input == 'p')
        playMove = Move.paper;
      else
        playMove = Move.scissors;

      final random = rng.nextInt(3);
      final aiMove = Move.values[random];

      print('Ai Move: ${aiMove.name}');
      print('Your Move: ${playMove.name}');

      if (playMove == aiMove) {
        print('It\'s a draw');
      } else if (playMove == Move.rock && aiMove == Move.scissors ||
          playMove == Move.paper && aiMove == Move.rock ||
          playMove == Move.scissors && aiMove == Move.paper) {
        print('You win');
      } else {
        print('You lose');
      }
      continue;
    } else if (input == 'q') {
      break;
    } else {
      print('Invalid input');
    }
  }
}
