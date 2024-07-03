import 'package:flutter/material.dart';
import 'package:mountapp/Category_Model.dart';

class AppCategoryList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding:EdgeInsets.all(20),
            child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
         Text('Category',
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
    ),
         Text('See More',
         style: TextStyle(color: Colors.green,fontSize: 12, fontWeight: FontWeight.bold)
    ),
  ]
)
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(left: 10),
            child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,

            itemBuilder: (context, index) {

              CategoryModel currentCategory = categories[index];

    return Container(
  width: 100,
  margin: EdgeInsets.only(top: 10, right: 10),
  padding: EdgeInsets.all(10),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2),
    borderRadius: BorderRadius.circular(10)
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(currentCategory.icon, color: Colors.green),
      Text(currentCategory.category,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
      )
    ],
  )
);
  }
)
          ),
        ],
      )
    );
  }
}
