import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/sample_data.dart';
import '../widgets/member_tile.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({super.key});

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  String _query = '';
  String _roleFilter = 'All';

  @override
  Widget build(BuildContext context) {
    var members = SampleData.members;

    if (_roleFilter != 'All') {
      members = members.where((m) => m.role == _roleFilter).toList();
    }
    if (_query.isNotEmpty) {
      members = members
          .where((m) =>
              m.name.toLowerCase().contains(_query.toLowerCase()) ||
              m.clubName.toLowerCase().contains(_query.toLowerCase()))
          .toList();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Text(
                'Members',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: (v) => setState(() => _query = v),
                decoration: InputDecoration(
                  hintText: 'Search members or clubs...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: ['All', 'Admin', 'Club Lead', 'Member']
                    .map((role) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(role),
                            selected: _roleFilter == role,
                            onSelected: (_) =>
                                setState(() => _roleFilter = role),
                            selectedColor: Colors.indigo.shade100,
                            checkmarkColor: Colors.indigo,
                          ),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return MemberTile(member: members[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
