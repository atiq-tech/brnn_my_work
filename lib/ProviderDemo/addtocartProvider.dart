import 'package:flutter/cupertino.dart';

class AddtoCartProvider with ChangeNotifier{
  int _count=0;
  int _productount=0;
  int _selectedindex=0;

  int get count => _count;
  int get  productount => _productount;
  int get  selectedindex => _selectedindex;

  // void selectedindexfunction() {
  //   _count++;
  //   notifyListeners();
  // }
  void setcount() {
    _count++;
    notifyListeners();
  }
  void minuscount() {
    _count--;
    notifyListeners();
  }

  void clear() {
    _count==0;
    notifyListeners();
  }

  void productountincrease() {
    _productount++;
    notifyListeners();
  }
  void productountdecrease() {
    _productount--;
    notifyListeners();
  }

}