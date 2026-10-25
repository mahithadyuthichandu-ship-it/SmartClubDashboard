class Member {
  final String id;
  final String name;
  final String role; // Admin, Club Lead, Member
  final String clubName;
  final String department;
  final String year;
  final String email;
  final bool isActive;

  const Member({
    required this.id,
    required this.name,
    required this.role,
    required this.clubName,
    required this.department,
    required this.year,
    required this.email,
    this.isActive = true,
  });
}
