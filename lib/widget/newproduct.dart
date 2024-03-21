import 'package:flutter/material.dart';
import 'package:managerrestaurant/Model/product.dart';

class newproduct extends StatefulWidget {
  const newproduct({super.key, required this.onAddProduct});
  final void Function(product newproduct) onAddProduct;
  @override
  State<newproduct> createState() => _newproductState();
}

class _newproductState extends State<newproduct> {
  DateTime _selecteddate = DateTime.now();
  Category _selectedcategory = Category.Bread;
  final _nameproduct = TextEditingController();
  final _amountroduct = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _nameproduct.dispose();
    _amountroduct.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
                width: 2000,
                color: Colors.green[500],
                child: const Center(
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 32)),
                        Text('Thêm sản phẩm',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            )),
                      ],
                    ))),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                   TextField(
                    controller: _nameproduct,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tên sản phẩm mới',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 5)),
                    style: const TextStyle(fontSize: 20,fontStyle: FontStyle.italic),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                   TextField(
                    controller: _amountroduct,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Giá',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 5)),
                    style: const TextStyle(fontSize: 20,fontStyle: FontStyle.italic),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  Row(
                    children: [
                      const Text('Loại sản phẩm:',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                      const Padding(padding: EdgeInsets.only(right: 10)),
                      DropdownButton(
                        dropdownColor: Colors.grey[200],

                          style: const TextStyle(fontSize: 20,color: Colors.black),
                          value: _selectedcategory,
                          items: Category.values
                              .map((e) => DropdownMenuItem(
                              value: e, child:  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(NameCategory[e].toString().toUpperCase()),
                                  const Padding(padding: EdgeInsets.only(right: 10)),
                                  Image(image: AssetImage(IconCategory[e]!),height: 30),
                                ],
                              )))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedcategory = value!;
                            });
                          }
                      ),

                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 5)),
                  Row(children: [
                    const Text('Ngày thêm:',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20)),
                    const Padding(padding: EdgeInsets.only(right: 10)),
                    InkWell(
                      onTap: () async {
                        final pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2025));
                        setState(() {
                          _selecteddate = pickeddate!;
                        });
                      },
                      child: Row(
                        children: [

                          const Icon(Icons.calendar_month,size: 30,color: Colors.blue),
                          const Padding(padding: EdgeInsets.only(right: 10)),
                          Text(formatdate.format(_selecteddate),style: TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),


                  ]),
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
        
                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.red[500]!),shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Row(
                            children: [Icon(Icons.close,color: Colors.white,size: 30), Text('Đóng',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)],
                          )),
                      const Padding(padding: EdgeInsets.only(right: 10)),
                      ElevatedButton(
                          onPressed: () {
                            widget.onAddProduct(product(title: _nameproduct.text, amount: int.parse(_amountroduct.text) , date: _selecteddate, cate: _selectedcategory));
                          },
                          style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll<Color>(Colors.green),shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                          child: const Row(
                            children: [Icon(Icons.add,color: Colors.white,size: 30), Text('Thêm',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)],
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
