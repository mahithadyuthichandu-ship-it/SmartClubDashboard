class Club {
  final String id;
  final String name;
  final String category;
  final String description;
  final String leadName;
  final int memberCount;
  final String imageEmoji;
  final ColorData color;

  const Club({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.leadName,
    required this.memberCount,
    required this.imageEmoji,
    required this.color,
  });
}

class ColorData {
  final int value;
  const ColorData(this.value);
}
