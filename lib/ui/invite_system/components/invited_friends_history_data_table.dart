import 'package:flutter/material.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/ui/add_balance/model/payment_model/payment_model.dart';

import '../model/invited_friends_history_model.dart';

class InvitedFriendsHistoryDataTable extends StatelessWidget {
  const InvitedFriendsHistoryDataTable({super.key,required this.invitedFriendsHistory});


  final List<InvitedFriendsHistoryModel> invitedFriendsHistory;

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columnSpacing: context.width / 12,
      showCheckboxColumn: false, // Eğer seçim sütunu istemiyorsanız false yapabilirsiniz
      header: const Text('Kazançlar'),
      rowsPerPage: 6, // Her sayfadaki satır sayısı
      columns: const [
        DataColumn(label: Text('Tarih',style: TextStyle(fontSize: 20),)),
        DataColumn(label: Text('İsim',style: TextStyle(fontSize: 20),)),
        DataColumn(label: Text('Kazanç',style: TextStyle(fontSize: 20),)),
      ],
      source: InvitedFriendsHistoryDataSource(invitedFriendsHistory),
    );
  }
}

class InvitedFriendsHistoryDataSource extends DataTableSource {
  final List<InvitedFriendsHistoryModel> _data;

  InvitedFriendsHistoryDataSource(this._data);

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) return null;
    final invitedFriend = _data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(invitedFriend.date.toString(),style: const TextStyle(fontSize: 14),textAlign: TextAlign.center,)),
        DataCell(Text(invitedFriend.invitedUserName.toString(),style: const TextStyle(fontSize: 15),textAlign: TextAlign.center,)),
        DataCell(Text(invitedFriend.earnedBonus.toString(),style: const TextStyle(fontSize: 15),textAlign: TextAlign.center,)),
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





