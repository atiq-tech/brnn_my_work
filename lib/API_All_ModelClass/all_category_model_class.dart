// class All_Category_Model_Api {
//   List<Data>? _data;
//
//   All_Category_Model_Api({List<Data>? data}) {
//     if (data != null) {
//       this._data = data;
//     }
//   }
//
//   List<Data>? get data => _data;
//   set data(List<Data>? data) => _data = data;
//
//   All_Category_Model_Api.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       _data = <Data>[];
//       json['data'].forEach((v) {
//         _data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this._data != null) {
//       data['data'] = this._data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int? _id;
//   String? _name;
//   String? _slug;
//   String? _details;
//   String? _image;
//   String? _thumbimage;
//   String? _smallimage;
//   String? _status;
//   String? _isHomepage;
//   String? _isMenu;
//   String? _saveBy;
//   Null? _updatedBy;
//   String? _ipAddress;
//   Null? _deletedAt;
//   String? _createdAt;
//   String? _updatedAt;
//
//   Data(
//       {int? id,
//         String? name,
//         String? slug,
//         String? details,
//         String? image,
//         String? thumbimage,
//         String? smallimage,
//         String? status,
//         String? isHomepage,
//         String? isMenu,
//         String? saveBy,
//         Null? updatedBy,
//         String? ipAddress,
//         Null? deletedAt,
//         String? createdAt,
//         String? updatedAt}) {
//     if (id != null) {
//       this._id = id;
//     }
//     if (name != null) {
//       this._name = name;
//     }
//     if (slug != null) {
//       this._slug = slug;
//     }
//     if (details != null) {
//       this._details = details;
//     }
//     if (image != null) {
//       this._image = image;
//     }
//     if (thumbimage != null) {
//       this._thumbimage = thumbimage;
//     }
//     if (smallimage != null) {
//       this._smallimage = smallimage;
//     }
//     if (status != null) {
//       this._status = status;
//     }
//     if (isHomepage != null) {
//       this._isHomepage = isHomepage;
//     }
//     if (isMenu != null) {
//       this._isMenu = isMenu;
//     }
//     if (saveBy != null) {
//       this._saveBy = saveBy;
//     }
//     if (updatedBy != null) {
//       this._updatedBy = updatedBy;
//     }
//     if (ipAddress != null) {
//       this._ipAddress = ipAddress;
//     }
//     if (deletedAt != null) {
//       this._deletedAt = deletedAt;
//     }
//     if (createdAt != null) {
//       this._createdAt = createdAt;
//     }
//     if (updatedAt != null) {
//       this._updatedAt = updatedAt;
//     }
//   }
//
//   int? get id => _id;
//   set id(int? id) => _id = id;
//   String? get name => _name;
//   set name(String? name) => _name = name;
//   String? get slug => _slug;
//   set slug(String? slug) => _slug = slug;
//   String? get details => _details;
//   set details(String? details) => _details = details;
//   String? get image => _image;
//   set image(String? image) => _image = image;
//   String? get thumbimage => _thumbimage;
//   set thumbimage(String? thumbimage) => _thumbimage = thumbimage;
//   String? get smallimage => _smallimage;
//   set smallimage(String? smallimage) => _smallimage = smallimage;
//   String? get status => _status;
//   set status(String? status) => _status = status;
//   String? get isHomepage => _isHomepage;
//   set isHomepage(String? isHomepage) => _isHomepage = isHomepage;
//   String? get isMenu => _isMenu;
//   set isMenu(String? isMenu) => _isMenu = isMenu;
//   String? get saveBy => _saveBy;
//   set saveBy(String? saveBy) => _saveBy = saveBy;
//   Null? get updatedBy => _updatedBy;
//   set updatedBy(Null? updatedBy) => _updatedBy = updatedBy;
//   String? get ipAddress => _ipAddress;
//   set ipAddress(String? ipAddress) => _ipAddress = ipAddress;
//   Null? get deletedAt => _deletedAt;
//   set deletedAt(Null? deletedAt) => _deletedAt = deletedAt;
//   String? get createdAt => _createdAt;
//   set createdAt(String? createdAt) => _createdAt = createdAt;
//   String? get updatedAt => _updatedAt;
//   set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
//
//   Data.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _name = json['name'];
//     _slug = json['slug'];
//     _details = json['details'];
//     _image = json['image'];
//     _thumbimage = json['thumbimage'];
//     _smallimage = json['smallimage'];
//     _status = json['status'];
//     _isHomepage = json['is_homepage'];
//     _isMenu = json['is_menu'];
//     _saveBy = json['save_by'];
//     _updatedBy = json['updated_by'];
//     _ipAddress = json['ip_address'];
//     _deletedAt = json['deleted_at'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this._id;
//     data['name'] = this._name;
//     data['slug'] = this._slug;
//     data['details'] = this._details;
//     data['image'] = this._image;
//     data['thumbimage'] = this._thumbimage;
//     data['smallimage'] = this._smallimage;
//     data['status'] = this._status;
//     data['is_homepage'] = this._isHomepage;
//     data['is_menu'] = this._isMenu;
//     data['save_by'] = this._saveBy;
//     data['updated_by'] = this._updatedBy;
//     data['ip_address'] = this._ipAddress;
//     data['deleted_at'] = this._deletedAt;
//     data['created_at'] = this._createdAt;
//     data['updated_at'] = this._updatedAt;
//     return data;
//   }
// }



class All_Category_Model_Api {
  List<Data>? _data;

  All_Category_Model_Api({List<Data>? data}) {
    if (data != null) {
      this._data = data;
    }
  }

  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  All_Category_Model_Api.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? _id;
  String? _name;
  String? _slug;
  String? _details;
  String? _image;
  String? _thumbimage;
  String? _smallimage;
  String? _status;
  String? _isHomepage;
  String? _isMenu;
  String? _saveBy;
  Null? _updatedBy;
  String? _ipAddress;
  Null? _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  List<SubCategory>? _subCategory;

  Data(
      {int? id,
        String? name,
        String? slug,
        String? details,
        String? image,
        String? thumbimage,
        String? smallimage,
        String? status,
        String? isHomepage,
        String? isMenu,
        String? saveBy,
        Null? updatedBy,
        String? ipAddress,
        Null? deletedAt,
        String? createdAt,
        String? updatedAt,
        List<SubCategory>? subCategory}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (details != null) {
      this._details = details;
    }
    if (image != null) {
      this._image = image;
    }
    if (thumbimage != null) {
      this._thumbimage = thumbimage;
    }
    if (smallimage != null) {
      this._smallimage = smallimage;
    }
    if (status != null) {
      this._status = status;
    }
    if (isHomepage != null) {
      this._isHomepage = isHomepage;
    }
    if (isMenu != null) {
      this._isMenu = isMenu;
    }
    if (saveBy != null) {
      this._saveBy = saveBy;
    }
    if (updatedBy != null) {
      this._updatedBy = updatedBy;
    }
    if (ipAddress != null) {
      this._ipAddress = ipAddress;
    }
    if (deletedAt != null) {
      this._deletedAt = deletedAt;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (subCategory != null) {
      this._subCategory = subCategory;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get details => _details;
  set details(String? details) => _details = details;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get thumbimage => _thumbimage;
  set thumbimage(String? thumbimage) => _thumbimage = thumbimage;
  String? get smallimage => _smallimage;
  set smallimage(String? smallimage) => _smallimage = smallimage;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get isHomepage => _isHomepage;
  set isHomepage(String? isHomepage) => _isHomepage = isHomepage;
  String? get isMenu => _isMenu;
  set isMenu(String? isMenu) => _isMenu = isMenu;
  String? get saveBy => _saveBy;
  set saveBy(String? saveBy) => _saveBy = saveBy;
  Null? get updatedBy => _updatedBy;
  set updatedBy(Null? updatedBy) => _updatedBy = updatedBy;
  String? get ipAddress => _ipAddress;
  set ipAddress(String? ipAddress) => _ipAddress = ipAddress;
  Null? get deletedAt => _deletedAt;
  set deletedAt(Null? deletedAt) => _deletedAt = deletedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  List<SubCategory>? get subCategory => _subCategory;
  set subCategory(List<SubCategory>? subCategory) => _subCategory = subCategory;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _details = json['details'];
    _image = json['image'];
    _thumbimage = json['thumbimage'];
    _smallimage = json['smallimage'];
    _status = json['status'];
    _isHomepage = json['is_homepage'];
    _isMenu = json['is_menu'];
    _saveBy = json['save_by'];
    _updatedBy = json['updated_by'];
    _ipAddress = json['ip_address'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['sub_category'] != null) {
      _subCategory = <SubCategory>[];
      json['sub_category'].forEach((v) {
        _subCategory!.add(new SubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['details'] = this._details;
    data['image'] = this._image;
    data['thumbimage'] = this._thumbimage;
    data['smallimage'] = this._smallimage;
    data['status'] = this._status;
    data['is_homepage'] = this._isHomepage;
    data['is_menu'] = this._isMenu;
    data['save_by'] = this._saveBy;
    data['updated_by'] = this._updatedBy;
    data['ip_address'] = this._ipAddress;
    data['deleted_at'] = this._deletedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._subCategory != null) {
      data['sub_category'] = this._subCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategory {
  int? _id;
  int? _categoryId;
  String? _name;
  String? _slug;
  String? _image;
  String? _status;
  String? _saveBy;
  Null? _updatedBy;
  String? _ipAddress;
  Null? _deletedAt;
  String? _createdAt;
  String? _updatedAt;

  SubCategory(
      {int? id,
        int? categoryId,
        String? name,
        String? slug,
        String? image,
        String? status,
        String? saveBy,
        Null? updatedBy,
        String? ipAddress,
        Null? deletedAt,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (categoryId != null) {
      this._categoryId = categoryId;
    }
    if (name != null) {
      this._name = name;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (image != null) {
      this._image = image;
    }
    if (status != null) {
      this._status = status;
    }
    if (saveBy != null) {
      this._saveBy = saveBy;
    }
    if (updatedBy != null) {
      this._updatedBy = updatedBy;
    }
    if (ipAddress != null) {
      this._ipAddress = ipAddress;
    }
    if (deletedAt != null) {
      this._deletedAt = deletedAt;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get saveBy => _saveBy;
  set saveBy(String? saveBy) => _saveBy = saveBy;
  Null? get updatedBy => _updatedBy;
  set updatedBy(Null? updatedBy) => _updatedBy = updatedBy;
  String? get ipAddress => _ipAddress;
  set ipAddress(String? ipAddress) => _ipAddress = ipAddress;
  Null? get deletedAt => _deletedAt;
  set deletedAt(Null? deletedAt) => _deletedAt = deletedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  SubCategory.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _name = json['name'];
    _slug = json['slug'];
    _image = json['image'];
    _status = json['status'];
    _saveBy = json['save_by'];
    _updatedBy = json['updated_by'];
    _ipAddress = json['ip_address'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['category_id'] = this._categoryId;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['image'] = this._image;
    data['status'] = this._status;
    data['save_by'] = this._saveBy;
    data['updated_by'] = this._updatedBy;
    data['ip_address'] = this._ipAddress;
    data['deleted_at'] = this._deletedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}








