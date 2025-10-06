import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:x_calcu/features/partners/data/models/partner_details_model.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class PdfService {
  /// **Generate and share PDF for selected operations */
  static Future<void> generateAndShareOperationsPdf({
    required List<PartnerDetailsOperation> operations,
    required String partnerName,
  }) async {
    try {
      printSuccess('📄 Generating PDF for ${operations.length} operations');

      final pdf = pw.Document();

      // First page with header and first operation
      if (operations.isNotEmpty) {
        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            margin: const pw.EdgeInsets.all(20),
            build: (pw.Context context) {
              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Header
                  _buildHeader(partnerName, operations.length),
                  pw.SizedBox(height: 20),

                  // First operation
                  _buildOperationCard(operations[0], 1),
                ],
              );
            },
          ),
        );
      }

      // Remaining operations (2 per page)
      for (int i = 1; i < operations.length; i += 2) {
        // Each page contains 2 operations
        final pageOperations = operations.skip(i).take(2).toList();

        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            margin: const pw.EdgeInsets.all(20),
            build: (pw.Context context) {
              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Operations
                  ...pageOperations.asMap().entries.map((entry) {
                    final operationIndex = entry.key;
                    final operation = entry.value;
                    final globalOperationNumber = i + operationIndex + 1;
                    return pw.Column(
                      children: [
                        _buildOperationCard(operation, globalOperationNumber),
                        if (operationIndex < pageOperations.length - 1)
                          pw.SizedBox(height: 20),
                      ],
                    );
                  }),
                ],
              );
            },
          ),
        );
      }

      // Share the PDF
      await Printing.sharePdf(
        bytes: await pdf.save(),
        filename: 'operations_${DateTime.now().millisecondsSinceEpoch}.pdf',
      );

      printSuccess('✅ PDF generated and shared successfully');
    } catch (e) {
      printError('❌ Error generating PDF: $e');
      rethrow;
    }
  }

  /// **Build PDF header */
  static pw.Widget _buildHeader(String partnerName, int operationsCount) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(20),
      decoration: pw.BoxDecoration(
        color: PdfColors.blue50,
        borderRadius: pw.BorderRadius.circular(10),
        border: pw.Border.all(color: PdfColors.blue200),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Operations Report',
            style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.blue800,
            ),
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            'Partner: $partnerName',
            style: pw.TextStyle(fontSize: 16, color: PdfColors.blue700),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            'Total Operations: $operationsCount',
            style: pw.TextStyle(fontSize: 14, color: PdfColors.blue600),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            'Generated: ${DateTime.now().toString().split('.')[0]}',
            style: pw.TextStyle(fontSize: 12, color: PdfColors.blue500),
          ),
        ],
      ),
    );
  }

  /// **Build operation card for PDF */
  static pw.Widget _buildOperationCard(
    PartnerDetailsOperation operation,
    int operationNumber,
  ) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey50,
        borderRadius: pw.BorderRadius.circular(8),
        border: pw.Border.all(color: PdfColors.grey300),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // Header row
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                'Operation #$operationNumber',
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.grey800,
                ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: pw.BoxDecoration(
                  color: _getOperationTypeColor(operation.operationType),
                  borderRadius: pw.BorderRadius.circular(12),
                ),
                child: pw.Text(
                  operation.operationType ?? 'Unknown',
                  style: pw.TextStyle(
                    fontSize: 12,
                    color: PdfColors.white,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 12),

          // Client name
          pw.Text(
            'Client: ${operation.clientName ?? 'N/A'}',
            style: pw.TextStyle(fontSize: 14, color: PdfColors.grey700),
          ),
          pw.SizedBox(height: 8),

          // Invoice details
          pw.Row(
            children: [
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Invoice Number',
                      style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColors.grey600,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      operation.invoiceNumber ?? 'N/A',
                      style: pw.TextStyle(
                        fontSize: 14,
                        color: PdfColors.grey800,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(width: 16),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Invoice Value',
                      style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColors.grey600,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      operation.invoiceValue?.toStringAsFixed(2) ?? '0.00',
                      style: pw.TextStyle(
                        fontSize: 14,
                        color: PdfColors.grey800,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 12),

          // Payment details
          if (operation.invoicePayment?.totalValue != null) ...[
            pw.Text(
              'Payment Details:',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.green700,
              ),
            ),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Paid Amount',
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.grey600,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        operation.invoicePayment!.totalValue!.toStringAsFixed(
                          2,
                        ),
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.green700,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(width: 16),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Remaining',
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.grey600,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        operation.remainingFromInvoice?.toStringAsFixed(2) ??
                            '0.00',
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.red700,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 12),
          ],

          // Payment details breakdown
          if (operation.invoicePayment?.details != null &&
              operation.invoicePayment!.details!.isNotEmpty) ...[
            pw.Text(
              'Payment Breakdown:',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blue700,
              ),
            ),
            pw.SizedBox(height: 8),
            ...operation.invoicePayment!.details!.map(
              (detail) => pw.Container(
                margin: const pw.EdgeInsets.only(bottom: 4),
                padding: const pw.EdgeInsets.all(8),
                decoration: pw.BoxDecoration(
                  color: PdfColors.grey100,
                  borderRadius: pw.BorderRadius.circular(4),
                ),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Value: ${detail.invoiceValue?.toStringAsFixed(2) ?? '0.00'}',
                      style: pw.TextStyle(fontSize: 12),
                    ),
                    pw.Text(
                      'Date: ${detail.invoiceDate ?? 'N/A'}',
                      style: pw.TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            pw.SizedBox(height: 12),
          ],

          // Percentage details
          if (operation.myPercentage != null) ...[
            pw.Text(
              'Percentage Details:',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.orange700,
              ),
            ),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Percentage',
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.grey600,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        operation.myPercentage!.percentage ?? 'N/A',
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.blue700,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(width: 16),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Percentage Value',
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.grey600,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        operation.myPercentage!.percentageValue
                                ?.toStringAsFixed(2) ??
                            '0.00',
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.blue700,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Due Amount',
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.grey600,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        operation.dueAmount?.toStringAsFixed(2) ?? '0.00',
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.orange700,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(width: 16),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Remaining Amount',
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.grey600,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        operation.remainingAmount?.toStringAsFixed(2) ?? '0.00',
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.red700,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 12),
          ],

          // Received amount details
          if (operation.receivedAmount?.totalValue != null) ...[
            pw.Text(
              'Received Amount Details:',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.purple700,
              ),
            ),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Received Amount',
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.grey600,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        operation.receivedAmount!.totalValue!.toStringAsFixed(
                          2,
                        ),
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.purple700,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(width: 16),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Remaining Amount',
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.grey600,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        operation.remainingAmount?.toStringAsFixed(2) ?? '0.00',
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.red700,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 12),
          ],

          // Date and notes
          pw.Row(
            children: [
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Date',
                      style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColors.grey600,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      operation.date ?? 'N/A',
                      style: pw.TextStyle(
                        fontSize: 14,
                        color: PdfColors.grey800,
                      ),
                    ),
                  ],
                ),
              ),
              if (operation.notificationDate != null) ...[
                pw.SizedBox(width: 16),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Notification Date',
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.grey600,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        operation.notificationDate!,
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColors.grey800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
          if (operation.notes != null && operation.notes!.isNotEmpty) ...[
            pw.SizedBox(height: 8),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Notes',
                  style: pw.TextStyle(
                    fontSize: 12,
                    color: PdfColors.grey600,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  operation.notes!,
                  style: pw.TextStyle(fontSize: 14, color: PdfColors.grey800),
                  textAlign: pw.TextAlign.start,
                  maxLines: 10,
                  overflow: pw.TextOverflow.clip,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  /// **Get color for operation type */
  static PdfColor _getOperationTypeColor(String? operationType) {
    switch (operationType?.toLowerCase()) {
      case 'input':
        return PdfColors.green600;
      case 'output':
        return PdfColors.red600;
      default:
        return PdfColors.grey600;
    }
  }
}
