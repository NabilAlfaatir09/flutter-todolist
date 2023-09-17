import 'package:flutter/material.dart';

import '../models/list_model.dart';
import '../widgets/list_item.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _listController = TextEditingController();
  final listModel = ListModel.listModelfunc();
  List<ListModel> _searchList = [];

  @override
  void initState() {
    _searchList = listModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(64, 224, 208, 1),
        leading: const Icon(Icons.menu),
        title: Text("Welcome ${widget.username}"),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage("assets/profile.jpeg"),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                // ini adalah bagian search
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onChanged: (value) => _handleListSearch(value),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 20,
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(maxHeight: 20, minWidth: 25),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                // ini adalah bagian list agenda
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          "List Agenda/jadwal",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (ListModel list in _searchList)
                        ListItem(
                          list: list,
                          onListChange: _handleListChange,
                          onDeleteList: _handleListDelete,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _listController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukkan agenda/jadwal baru!"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _handleListAdd(_listController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(64, 224, 208, 1),
                        minimumSize: const Size(60, 60),
                        elevation: 10),
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleListChange(ListModel listModel) {
    setState(() {
      listModel.isDone = !listModel.isDone;
    });
  }

  void _handleListDelete(String id) {
    setState(() {
      listModel.removeWhere((element) => element.id == id);
    });
  }

  void _handleListAdd(String text) {
    setState(() {
      listModel.add(ListModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(), text: text));
    });
    _listController.clear();
  }

  void _handleListSearch(String search) {
    List<ListModel> result = [];
    if (search.isEmpty) {
      result = listModel;
    } else {
      result = listModel
          .where((element) =>
              element.text.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
    setState(() {
      _searchList = result;
    });
  }
}
