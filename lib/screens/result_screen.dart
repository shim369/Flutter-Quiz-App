import 'package:flutter/material.dart';
import '/widgets/next_button.dart';
import '../main.dart';
import '/models/questions.dart';

// 結果画面を表す ResultScreen ウィジェット
class ResultScreen extends StatelessWidget {
  // コンストラクター
  const ResultScreen({
    super.key,
    required this.score,
  });

  // プロパティ
  final int score;

  void onPressed(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainApp()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold ウィジェットで画面を構築
    return Scaffold(
      // Column ウィジェットで縦方向にウィジェットを配置
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 余白のための SizedBox ウィジェット
          const SizedBox(width: 1000),
          // スコアを表示するテキスト
          const Text(
            'あなたの得点: ',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
          // スコアを円形の進捗バーで表示
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                // CircularProgressIndicator ウィジェットで進捗バーを構築
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  // スコアに応じて進捗を設定
                  value: score / 10,
                  color: Colors.green,
                  backgroundColor: Colors.white,
                ),
              ),
              // スコアとパーセンテージを表示するコラム
              Column(
                children: [
                  Text(
                    score.toString(),
                    style: const TextStyle(fontSize: 80),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    // スコアのパーセンテージを表示
                    '${(score / questions.length * 100).round()}%',
                    style: const TextStyle(fontSize: 25),
                  )
                ],
              ),
            ],
          ),
          // トップページへ戻るボタン
          Column(
            children: [
              RectangularButton(onPressed: () => onPressed(context), label: 'トップページへ'),
            ],
          ),
        ],
      ),
    );
  }
}
