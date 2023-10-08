
class Contact{
  String ? productname,number;
  int ? id;

  Contact({required this.number,required this.productname,this.id});

  factory Contact.fromJson(Map<String, dynamic> json)=>Contact(
    number: json['number'],
    productname: json['productname'],
    id: json['id'],
  );

  Map<String, dynamic> toJson()=>{
    'id' : id,
    'productname' : productname,
    'number' : number,
  };

}


