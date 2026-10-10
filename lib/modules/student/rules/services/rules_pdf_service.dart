import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

class RulesPdfService {
  /// Generates a genuine formatted Hostel Rules PDF Document
  static Future<Uint8List> generatePdfData() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'SUNRISE CAMPUS RESIDENCIES',
                        style: pw.TextStyle(
                          fontSize: 11,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.blue900,
                        ),
                      ),
                      pw.SizedBox(height: 2),
                      pw.Text(
                        'Westwood Hall & Oak Court',
                        style: pw.TextStyle(
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.blueGrey900,
                        ),
                      ),
                      pw.Text(
                        '412 University Blvd, Campus North Quad',
                        style: const pw.TextStyle(
                          fontSize: 9,
                          color: PdfColors.grey700,
                        ),
                      ),
                    ],
                  ),
                  pw.Container(
                    padding: const pw.EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.blue800, width: 1),
                      borderRadius: pw.BorderRadius.circular(6),
                    ),
                    child: pw.Text(
                      'OFFICIAL HANDBOOK\nSESSION 2024 - 2025',
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.blue900,
                      ),
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 12),
              pw.Divider(thickness: 1.5, color: PdfColors.blue900),
              pw.SizedBox(height: 10),

              // Title
              pw.Center(
                child: pw.Text(
                  'HOSTEL CODE OF CONDUCT & RESIDENTIAL SAFETY REGULATIONS',
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(
                    fontSize: 13,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.blueGrey900,
                  ),
                ),
              ),
              pw.SizedBox(height: 14),

              // Clauses
              _buildClause(
                '1. Curfew & Gate Entry Regulations',
                'Curfew on weekdays is strictly 10:00 PM; weekends 11:00 PM. Digital QR Pass required for entry after 8:00 PM. Unapproved late check-ins will incur a disciplinary penalty.',
              ),
              _buildClause(
                '2. Quiet Hours & Corridor Decorum',
                'Mandatory quiet hours observed from 10:30 PM to 6:00 AM daily. Amplified music, noisy gatherings, and loud disturbances in wings are strictly forbidden.',
              ),
              _buildClause(
                '3. Substance & Alcohol Prohibition Policy',
                'Zero tolerance for tobacco, alcohol, e-cigarettes, and illegal substances anywhere on premises. Violators will face immediate hostel suspension and eviction.',
              ),
              _buildClause(
                '4. Visitor & Guest Policies',
                'External visitors are restricted to the Ground Floor Reception Lounge. Visiting hours terminate at 8:00 PM prompt. Overnight guests are strictly prohibited.',
              ),
              _buildClause(
                '5. Electrical & Appliance Safety',
                'High wattage devices (induction stoves, immersion rods, room heaters) are prohibited. Only laptops, phone chargers, and desk lamps are permitted.',
              ),
              _buildClause(
                '6. Room Hygiene & Weekly Sanitary Inspections',
                'Residents must keep their rooms tidy and hygienic. Routine sanitary inspections take place every Saturday at 11:00 AM.',
              ),

              pw.Spacer(),

              // Signature Section
              pw.Divider(thickness: 0.8, color: PdfColors.grey400),
              pw.SizedBox(height: 8),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Dr. Vikram Sharma',
                        style: pw.TextStyle(
                          fontSize: 11,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.blue900,
                        ),
                      ),
                      pw.Text(
                        'Chief Hostel Warden • Residence Office 102',
                        style: const pw.TextStyle(
                          fontSize: 9,
                          color: PdfColors.grey700,
                        ),
                      ),
                    ],
                  ),
                  pw.Container(
                    padding: const pw.EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.green700),
                      borderRadius: pw.BorderRadius.circular(6),
                      color: PdfColors.green50,
                    ),
                    child: pw.Text(
                      'DIGITALLY VERIFIED DOCUMENT\nISSUED BY HOSTEL ADMINISTRATION',
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle(
                        fontSize: 7.5,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.green900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget _buildClause(String title, String body) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.blueGrey900,
            ),
          ),
          pw.SizedBox(height: 2),
          pw.Text(
            body,
            style: const pw.TextStyle(
              fontSize: 8.5,
              color: PdfColors.grey800,
              lineSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  /// Saves the PDF to system storage (Downloads / Documents directory)
  static Future<File> savePdfToStorage() async {
    final pdfBytes = await generatePdfData();
    const fileName = 'Westwood_Hall_Rules_2024-25.pdf';

    Directory? targetDir;

    try {
      if (Platform.isWindows) {
        // Try user's Downloads folder on Windows
        final userProfile = Platform.environment['USERPROFILE'];
        if (userProfile != null) {
          final winDownloads = Directory('$userProfile\\Downloads');
          if (winDownloads.existsSync()) {
            targetDir = winDownloads;
          }
        }
      } else if (Platform.isAndroid) {
        // On Android try downloads directory, or external storage
        try {
          targetDir = await getDownloadsDirectory();
        } catch (_) {}
      }

      targetDir ??= await getApplicationDocumentsDirectory();
    } catch (e) {
      targetDir = await getApplicationDocumentsDirectory();
    }

    final filePath = '${targetDir.path}${Platform.pathSeparator}$fileName';
    final file = File(filePath);
    await file.writeAsBytes(pdfBytes);
    return file;
  }

  /// Opens the saved PDF in system default viewer
  static Future<OpenResult> openPdf(String filePath) async {
    return await OpenFilex.open(filePath);
  }

  /// Shares the PDF via native system share dialog (WhatsApp, Drive, Email, Save to Files, etc.)
  static Future<ShareResult> sharePdf(String filePath) async {
    return await SharePlus.instance.share(
      ShareParams(
        files: [XFile(filePath)],
        subject: 'Westwood Hall Rules & Regulations Handbook (2024-2025)',
        text:
            'Hostel Rules, Code of Conduct & Safety Regulations PDF - Sunrise Campus Residencies',
      ),
    );
  }
}
