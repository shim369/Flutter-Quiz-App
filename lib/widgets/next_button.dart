import 'package:flutter/material.dart';

// 矩形ボタンを表す RectangularButton ウィジェット
class RectangularButton extends StatelessWidget {
  // コンストラクター
  const RectangularButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  // ボタンが押されたときのコールバック
  final VoidCallback? onPressed;

  // ボタンに表示されるラベル
  final String label;

  @override
  Widget build(BuildContext context) {
    // TextButton ウィジェットでテキストボタンを構築
    return TextButton(
      onPressed: onPressed,
      // SizedBox ウィジェットで固定のサイズを持つボタンを構築
      child: SizedBox(
        height: 50,
        width: double.infinity,
        // Card ウィジェットでカードデザインのボタンを構築
        child: Card(
          // ボタンが押された場合の背景色を設定
          color: onPressed != null ? Colors.white30 : null,
          // Center ウィジェットでラベルを中央に配置
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                letterSpacing: 2,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
