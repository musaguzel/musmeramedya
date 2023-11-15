import 'package:flutter/material.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';
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
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                    text: "${payment.selectedPaymentTotal} M ",
                    style: const TextStyle(
                        fontSize: 11.0,
                        color: Colors.black,
                        decoration: TextDecoration.lineThrough),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                          " ${payment.bonusPlusTotal} ",
                          style: const TextStyle(
                              fontSize: 13.0,
                              color: Colors.blue,
                              decoration: TextDecoration.none))
                    ]),
              ),
          Image.asset(
            'mcoin'.toPNG,
            width: 15,
            height: 15,
          ),
      ],
          ),
        ),),
        DataCell(
          Text((payment.status && !payment.isCancelled) ? 'Başarılı' : (!payment.status && !payment.isCancelled) ? 'İşlemde': 'İptal Edildi',style: TextStyle(color:(payment.status && !payment.isCancelled) ? Colors.green
              : (!payment.status && !payment.isCancelled) ? Colors.blueGrey : Colors.red,fontSize: 12),),
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





