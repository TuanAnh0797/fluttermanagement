import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managerrestaurant/Model/product.dart';
class products extends StatefulWidget {

  const products({required this.listproduct, super.key});
  final List<product> listproduct;
  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listproduct.length,
        itemBuilder: (ctx,index)=> Dismissible(
          key: UniqueKey(),
          onDismissed: (direction){
            widget.listproduct.removeAt(index);
          },
          child: Card(
          child: Row(
            children: [
              Image(image: AssetImage(IconCategory[widget.listproduct[index].cate]!),height: 70,width: 70,),
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Text(widget.listproduct[index].title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text('${widget.listproduct[index].amount.toString()} VNĐ',style: const TextStyle(fontSize: 15,fontStyle: FontStyle.italic,color: Colors.redAccent),),
                      Text('Ngày thêm: ${widget.listproduct[index].formattedDate}',style: const TextStyle(fontSize: 8,fontStyle: FontStyle.italic),),
                      //Text(widget.listproduct[index].cate.name),
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){

              },
                  icon: const Icon(Icons.edit,color: Colors.blue,)
              ),
              IconButton(
                  onPressed: (){
                    setState(() {
                      widget.listproduct.removeAt(index);
                    });
                  },
                  icon: const Icon(Icons.delete,color: Colors.red,)
              ),
            ],
          ),
              ),
        ));


  }
}
