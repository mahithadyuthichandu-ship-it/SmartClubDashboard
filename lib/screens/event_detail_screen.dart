import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/event.dart';

class EventDetailScreen extends StatefulWidget {
  final ClubEvent event;

  const EventDetailScreen({super.key, required this.event});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  late bool isRsvp;

  @override
  void initState() {
    super.initState();
    isRsvp = widget.event.isRsvp;
  }

  @override
  Widget build(BuildContext context) {
    final e = widget.event;
    final dateStr = DateFormat('EEEE, d MMMM yyyy').format(e.dateTime);
    final timeStr = DateFormat('hh:mm a').format(e.dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event Details',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: e.status == 'Completed'
                    ? Colors.grey.shade200
                    : Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                e.status,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: e.status == 'Completed'
                      ? Colors.grey.shade600
                      : Colors.indigo,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              e.title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              e.clubName,
              style: TextStyle(
                fontSize: 15,
                color: Colors.indigo.shade400,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            _infoRow(Icons.calendar_today, 'Date', dateStr),
            _infoRow(Icons.access_time, 'Time', timeStr),
            _infoRow(Icons.location_on, 'Venue', e.venue),
            _infoRow(Icons.people, 'Registered',
                '${e.registeredCount} / ${e.capacity}'),
            const SizedBox(height: 20),
            Text(
              'About',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              e.description,
              style: TextStyle(
                fontSize: 14.5,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            // Attendance progress
            Text(
              'Registration Progress',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: e.fillPercent,
                minHeight: 12,
                backgroundColor: Colors.grey.shade200,
                color: e.fillPercent > 0.85 ? Colors.orange : Colors.indigo,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${(e.fillPercent * 100).toStringAsFixed(0)}% filled',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: e.status == 'Upcoming'
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() => isRsvp = !isRsvp);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isRsvp
                              ? 'You have RSVP\'d for this event'
                              : 'RSVP cancelled',
                        ),
                      ),
                    );
                  },
                  icon: Icon(isRsvp ? Icons.check : Icons.event_available),
                  label: Text(isRsvp ? 'RSVP Confirmed' : 'RSVP Now'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                    backgroundColor:
                        isRsvp ? Colors.green : Colors.indigo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: Colors.indigo),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
