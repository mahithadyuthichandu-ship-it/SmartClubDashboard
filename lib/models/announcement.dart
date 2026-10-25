class Announcement {
  final String id;
  final String title;
  final String body;
  final String clubName;
  final DateTime date;
  final String priority; // High, Medium, Low
  final String author;

  const Announcement({
    required this.id,
    required this.title,
    required this.body,
    required this.clubName,
    required this.date,
    required this.priority,
    required this.author,
  });
}
