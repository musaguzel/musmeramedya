import 'package:flutter/material.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/ui/add_balance/model/payment_model/payment_model.dart';

class PaymentHistoryDataTable extends StatelessWidget {
   const PaymentHistoryDataTable({super.key,required this.paymentHistory});


  final List<PaymentModel> paymentHistory;

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columnSpacing: context.width / 11,
      showCheckboxColumn: false, // Eğer seçim sütunu istemiyorsanız false yapabilirsiniz
      header: const Text('Ödeme Geçmişi'),
      rowsPerPage: 3, // Her sayfadaki satır sayısı
      columns: const [
        DataColumn(label: Text('Tarih')),
        DataColumn(label: Text('Yöntem')),
        DataColumn(label: Text('Tutar')),
        DataColumn(label: Text('Durum')),
      ],
      source: PaymentHistoryDataSource(paymentHistory),
    );
  }
}

class PaymentHistoryDataSource extends DataTableSource {
  final List<PaymentModel> _data;

  PaymentHistoryDataSource(this._data);

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) return null;
    final payment = _data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(payment.date.toString(),style: const TextStyle(fontSize: 12),)),
        DataCell(Text(payment.selectedPaymentMethod,style: const TextStyle(fontSize: 13),)),
        DataCell(Container(
          padding: const EdgeInsets.all(1.0),
          //decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
          child: RichText(
            text: TextSpan(
                text: "${payment.selectedPaymentTotal} TL",
                style: TextStyle(
                    fontSize: 11.0,
                    color: Colors.red.withOpacity(0.6),
                    decoration: TextDecoration.lineThrough),
                children: <TextSpan>[
                  TextSpan(
                      text:
                      " ${payment.totalPayment} TL",
                      style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.green,
                          decoration: TextDecoration.none))
                ]),
          ),
        ),),
        DataCell(
          Text(payment.status ? 'Başarılı' : 'İşlemde',style: TextStyle(color: payment.status ? Colors.green : Colors.red,fontSize: 12),),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}










/*import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/ui/add_balance/model/payment_model/payment_model.dart';

class PaymentHistoryDataTable extends StatefulWidget {
  const PaymentHistoryDataTable({super.key, required this.paymentHistory});

  final List<PaymentModel> paymentHistory;

  @override
  State<PaymentHistoryDataTable> createState() => _PaymentHistoryDataTableState();
}

class _PaymentHistoryDataTableState extends State<PaymentHistoryDataTable> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 200,*/
     /* child: DataTable(
        columnSpacing: context.width / 11,

        showBottomBorder: true,
        columns: const [
          DataColumn2(label: Text('Tarih')),
          DataColumn2(label: Text('Yöntem')),
          DataColumn2(label: Text('Tutar')),
          DataColumn2(label: Text('Durum')),
        ],
        rows: widget.paymentHistory.map((payment) {
          return DataRow.byIndex(
            index: widget.paymentHistory.indexOf(payment),
            cells: [
              DataCell(Text(payment.date.toString())),
              DataCell(Text(payment.selectedPaymentMethod)),
              DataCell(Text(payment.totalPayment)),
              DataCell(Text(payment.status ? 'Başarılı': 'İşlemde',style: TextStyle(color: payment.status ? Colors.green : Colors.red),)),
            ],
          );
        }).toList(),
      ),
    );
  }
}*/