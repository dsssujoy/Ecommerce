import 'package:flutter/material.dart';
import 'package:suchi/features/home/widget/searchResult.dart';

import '../../../constants/global_variable.dart';

class SearchHome extends StatefulWidget {
  const SearchHome({super.key});

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  final TextEditingController searchText=TextEditingController();

  void NavigateSearchResult(String query){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Searchresult(serachQuery: query)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(

            children: [
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: TextFormField(
                  onFieldSubmitted: NavigateSearchResult,
                  // Aligns the text to the center
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 9),
                      prefixIcon: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Icon(Icons.search_outlined),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: GlobalVariable.customGreen),
                      ),
                      hintText: 'Search Your Need!',
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
