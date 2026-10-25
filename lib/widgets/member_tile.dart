import 'package:flutter/material.dart';
import '../models/member.dart';

class MemberTile extends StatelessWidget {
  final Member member;
  final VoidCallback? onTap;

  const MemberTile({super.key, required this.member, this.onTap});

  Color _roleColor(String role) {
    switch (role) {
      case 'Admin':
        return Colors.red;
      case 'Club Lead':
        return Colors.indigo;
      default:
        return Colors.teal;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _roleColor(member.role);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        onTap: onTap,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Text(
            member.name[0],
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          member.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '${member.department} • ${member.year}\n${member.clubName}',
          style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600),
        ),
        isThreeLine: true,
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            member.role,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
