class ColorLockEntity {
  final bool r;
  final bool g;
  final bool b;

  const ColorLockEntity({this.r = false, this.g = false, this.b = false});

  ColorLockEntity copyWith({bool? r, bool? g, bool? b}) {
    return ColorLockEntity(r: r ?? this.r, g: g ?? this.g, b: b ?? this.b);
  }
}
