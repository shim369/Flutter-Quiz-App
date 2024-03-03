import 'package:flutter/material.dart';

// AnswerCard ウィジェット
class AnswerCard extends StatelessWidget {
  // コンストラクター
  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  // プロパティ
  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    // 回答が正解かどうか
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    // 回答が不正解かどうか
    bool isWrongAnswer = !isCorrectAnswer && isSelected;

    // 選択肢が一つでも選択されている場合
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: selectedAnswerIndex != null
          ? Container(
        height: 70,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isCorrectAnswer
                ? Colors.green
                : isWrongAnswer
                ? Colors.red
                : Colors.white30,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                question,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // 正解の場合は正解アイコン、不正解の場合は不正解アイコンを表示
            isCorrectAnswer
                ? buildCorrectIcon()
                : isWrongAnswer
                ? buildWrongIcon()
                : const SizedBox.shrink(),
          ],
        ),
      )
      // 選択肢が選択されていない場合
          : Container(
        height: 70,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white30,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                question,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 正解アイコンを構築する関数
Widget buildCorrectIcon() => const CircleAvatar(
  radius: 15,
  backgroundColor: Colors.green,
  child: Icon(
    Icons.check,
    color: Colors.white,
  ),
);

// 不正解アイコンを構築する関数
Widget buildWrongIcon() => const CircleAvatar(
  radius: 15,
  backgroundColor: Colors.red,
  child: Icon(
    Icons.close,
    color: Colors.white,
  ),
);
