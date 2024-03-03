// クイズの質問を表す Question クラス
class Question {
  // 質問文
  final String question;
  // 選択肢のリスト
  final List<String> options;
  // 正解の選択肢のインデックス
  final int correctAnswerIndex;

  // コンストラクター
  const Question({
    required this.correctAnswerIndex,
    required this.question,
    required this.options,
  });
}
