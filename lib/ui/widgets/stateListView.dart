import 'package:covid19_india_app/data/models/my_state_data.dart';
import 'package:covid19_india_app/ui/pages/state_detail_page.dart';
import 'package:covid19_india_app/ui/widgets/state_list_tile.dart';
import 'package:flutter/material.dart';

class StateListView extends StatefulWidget {
  final List<MyStateData> stateData;
  const StateListView({Key key, this.stateData}) : super(key: key);

  @override
  _StateListViewState createState() => _StateListViewState();
}

class _StateListViewState extends State<StateListView> {
  TextEditingController _textEditingController = TextEditingController();
  String searchKeyWord = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 18),
          child: SizedBox(
            height: 0.07 * MediaQuery.of(context).size.height,
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: "Search State",
                labelStyle: TextStyle(color: Colors.black),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.deepPurple,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.deepPurple,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
              style: TextStyle(
                  fontFamily: "Rubik",
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              onChanged: (value) {
                setState(() {
                  searchKeyWord = value.toLowerCase();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (!(searchKeyWord.trim() == "" ||
                  widget.stateData[index].state
                      .toLowerCase()
                      .contains(searchKeyWord))) return Container();
              if (widget.stateData[index].state == "Total") return Container();
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => StateDetailPage(
                        stateData: widget.stateData[index],
                      ),
                    ),
                  );
                },
                child: StateListTile(
                  stateData: widget.stateData[index],
                ),
              );
            },
            itemCount: widget.stateData.length,
          ),
        ),
      ],
    );
  }
}
