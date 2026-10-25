class ClubEvent {
  final String id;
  final String title;
  final String clubName;
  final String clubId;
  final DateTime dateTime;
  final String venue;
  final String description;
  final int registeredCount;
  final int capacity;
  final String status; // Upcoming, Ongoing, Completed
  final bool isRsvp;

  const ClubEvent({
    required this.id,
    required this.title,
    required this.clubName,
    required this.clubId,
    required this.dateTime,
    required this.venue,
    required this.description,
    required this.registeredCount,
    required this.capacity,
    required this.status,
    this.isRsvp = false,
  });

  double get fillPercent =>
      capacity == 0 ? 0 : (registeredCount / capacity).clamp(0.0, 1.0);
}
