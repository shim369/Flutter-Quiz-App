import 'package:flutter/material.dart';

// モデル、結果画面、およびウィジェットのファイルからインポート
import '/models/questions.dart';
import '/screens/result_screen.dart';
import '/widgets/answer_card.dart';
import '/widgets/next_button.dart';

// クイズ画面を表す QuizScreen ウィジェット
class QuizScreen extends StatefulWidget {
  // コンストラクター
  const QuizScreen({super.key});

  // State オブジェクトを生成
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

// QuizScreen ウィジェットの State クラス
class _QuizScreenState extends State<QuizScreen> {
  // 選択された回答のインデックス
  int? selectedAnswerIndex;
  // 現在の質問のインデックス
  int questionIndex = 0;
  // スコア
  int score = 0;

  // 回答が選択されたときのコールバック
  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    // 正解の場合はスコアをインクリメント
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
    setState(() {});
  }

  // 次の質問に移動するコールバック
  void goToNextQuestion() {
    // 最後の質問でない場合は次の質問に進み、選択された回答をリセット
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // 現在の質問を取得
    final question = questions[questionIndex];
    // 最後の質問かどうかのフラグ
    bool isLastQuestion = questionIndex == questions.length - 1;

    // Scaffold ウィジェットで画面を構築
    return Scaffold(
      // AppBar ウィジェットでアプリの上部バーを構築
      appBar: AppBar(
        title: const Text('WEB制作クイズ'),
      ),
      // Padding ウィジェットで内側の余白を設定
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        // Column ウィジェットで縦方向にウィジェットを配置
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 質問文を表示するテキスト
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 21,
              ),
              textAlign: TextAlign.center,
            ),
            // 選択肢を表示する ListView.builder ウィジェット
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                // 選択肢ごとに GestureDetector ウィジェットで回答カードを構築
                return GestureDetector(
                  onTap: selectedAnswerIndex == null
                      ? () => pickAnswer(index)
                      : null,
                  child: AnswerCard(
                    currentIndex: index,
                    question: question.options[index],
                    isSelected: selectedAnswerIndex == index,
                    selectedAnswerIndex: selectedAnswerIndex,
                    correctAnswerIndex: question.correctAnswerIndex,
                  ),
                );
              },
            ),
            // 最後の質問の場合は結果画面へのボタンを表示、それ以外は次へのボタンを表示
            isLastQuestion
                ? RectangularButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => ResultScreen(
                      score: score,
                    ),
                  ),
                );
              },
              label: 'Finish',
            )
                : RectangularButton(
              onPressed:
              selectedAnswerIndex != null ? goToNextQuestion : null,
              label: '次の問題へ',
            ),
          ],
        ),
      ),
    );
  }
}
