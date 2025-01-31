// インターフェース定義
abstract class Sized {
  int getWidth();
  int getHeight();
  void setWidth(int width);
  void setHeight(int height);
}

// 基本クラス
class Rectangle implements Sized {
  int width;
  int height;

  Rectangle(this.width, this.height);

  @override
  int getWidth() => width;

  @override
  int getHeight() => height;

  @override
  void setWidth(int width) {
    this.width = width;
  }

  @override
  void setHeight(int height) {
    this.height = height;
  }
}

// LSP違反の実装
class Square extends Rectangle {
  Square(int size) : super(size, size);

  @override
  void setWidth(int width) {
    super.setWidth(width);
    super.setHeight(width);
  }

  @override
  void setHeight(int height) {
    super.setWidth(height);
    super.setHeight(height);
  }
}

// LSP準拠の実装
class Square2 {
  int size;

  Square2(this.size);

  Rectangle toRectangle() {
    return Rectangle(size, size);
  }
}

// テスト用関数
void useIt(Sized rectangle) {
  final width = rectangle.getWidth();
  rectangle.setHeight(10);
  final expectedArea = 10 * width;
  final actualArea = rectangle.getWidth() * rectangle.getHeight();

  if (expectedArea != actualArea) {
    throw Exception('Expected area not equal to actual');
  }
}

void main() {
  final rectangle = Rectangle(2, 3);
  useIt(rectangle); // 正常に動作

  final square = Square(5);
  useIt(square); // LSP違反により例外発生
}
