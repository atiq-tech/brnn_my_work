class AllProductModelClass {
  List<AllProductData>? _data;

  AllProductModelClass({List<AllProductData>? data}) {
    if (data != null) {
      this._data = data;
    }
  }

  List<AllProductData>? get data => _data;
  set data(List<AllProductData>? data) => _data = data;

  AllProductModelClass.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <AllProductData>[];
      json['data'].forEach((v) {
        _data!.add(new AllProductData.fromJson(v));
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

class AllProductData {
  int? _id;
  String? _productCode;
  String? _name;
  String? _slug;
  String? _model;
  int? _price;
  String? _simillarPorduct;
  String? _similarDiscount;
  String? _sizeId;
  String? _colorId;
  int? _categoryId;
  int? _subCategoryId;
  int? _brandId;
  String? _discount;
  String? _shortDetails;
  String? _description;
  String? _mainImage;
  String? _thumbImage;
  String? _smallImage;
  String? _sizeguide;
  String? _isFeature;
  String? _isCollectionTitle1;
  String? _isCollectionTitle2;
  String? _isDeal;
  String? _isTailoring;
  Null? _tailoringCharge;
  String? _isTrending;
  String? _newArrival;
  Null? _dealStart;
  Null? _dealEnd;
  String? _rewardPoint;
  int? _status;
  int? _quantity;
  String? _saveBy;
  Null? _updateBy;
  String? _ipAddress;
  Null? _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  List<Sizes>? _sizes;
  List<Colorss>? _colors;
  String? _currencyAmount;
  Category? _category;

  AllProductData(
      {int? id,
        String? productCode,
        String? name,
        String? slug,
        String? model,
        int? price,
        String? simillarPorduct,
        String? similarDiscount,
        String? sizeId,
        String? colorId,
        int? categoryId,
        int? subCategoryId,
        int? brandId,
        String? discount,
        String? shortDetails,
        String? description,
        String? mainImage,
        String? thumbImage,
        String? smallImage,
        String? sizeguide,
        String? isFeature,
        String? isCollectionTitle1,
        String? isCollectionTitle2,
        String? isDeal,
        String? isTailoring,
        Null? tailoringCharge,
        String? isTrending,
        String? newArrival,
        Null? dealStart,
        Null? dealEnd,
        String? rewardPoint,
        int? status,
        int? quantity,
        String? saveBy,
        Null? updateBy,
        String? ipAddress,
        Null? deletedAt,
        String? createdAt,
        String? updatedAt,
        List<Sizes>? sizes,
        List<Colorss>? colors,
        String? currencyAmount,
        Category? category}) {
    if (id != null) {
      this._id = id;
    }
    if (productCode != null) {
      this._productCode = productCode;
    }
    if (name != null) {
      this._name = name;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (model != null) {
      this._model = model;
    }
    if (price != null) {
      this._price = price;
    }
    if (simillarPorduct != null) {
      this._simillarPorduct = simillarPorduct;
    }
    if (similarDiscount != null) {
      this._similarDiscount = similarDiscount;
    }
    if (sizeId != null) {
      this._sizeId = sizeId;
    }
    if (colorId != null) {
      this._colorId = colorId;
    }
    if (categoryId != null) {
      this._categoryId = categoryId;
    }
    if (subCategoryId != null) {
      this._subCategoryId = subCategoryId;
    }
    if (brandId != null) {
      this._brandId = brandId;
    }
    if (discount != null) {
      this._discount = discount;
    }
    if (shortDetails != null) {
      this._shortDetails = shortDetails;
    }
    if (description != null) {
      this._description = description;
    }
    if (mainImage != null) {
      this._mainImage = mainImage;
    }
    if (thumbImage != null) {
      this._thumbImage = thumbImage;
    }
    if (smallImage != null) {
      this._smallImage = smallImage;
    }
    if (sizeguide != null) {
      this._sizeguide = sizeguide;
    }
    if (isFeature != null) {
      this._isFeature = isFeature;
    }
    if (isCollectionTitle1 != null) {
      this._isCollectionTitle1 = isCollectionTitle1;
    }
    if (isCollectionTitle2 != null) {
      this._isCollectionTitle2 = isCollectionTitle2;
    }
    if (isDeal != null) {
      this._isDeal = isDeal;
    }
    if (isTailoring != null) {
      this._isTailoring = isTailoring;
    }
    if (tailoringCharge != null) {
      this._tailoringCharge = tailoringCharge;
    }
    if (isTrending != null) {
      this._isTrending = isTrending;
    }
    if (newArrival != null) {
      this._newArrival = newArrival;
    }
    if (dealStart != null) {
      this._dealStart = dealStart;
    }
    if (dealEnd != null) {
      this._dealEnd = dealEnd;
    }
    if (rewardPoint != null) {
      this._rewardPoint = rewardPoint;
    }
    if (status != null) {
      this._status = status;
    }
    if (quantity != null) {
      this._quantity = quantity;
    }
    if (saveBy != null) {
      this._saveBy = saveBy;
    }
    if (updateBy != null) {
      this._updateBy = updateBy;
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
    if (sizes != null) {
      this._sizes = sizes;
    }
    if (colors != null) {
      this._colors = colors;
    }
    if (currencyAmount != null) {
      this._currencyAmount = currencyAmount;
    }
    if (category != null) {
      this._category = category;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get productCode => _productCode;
  set productCode(String? productCode) => _productCode = productCode;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get model => _model;
  set model(String? model) => _model = model;
  int? get price => _price;
  set price(int? price) => _price = price;
  String? get simillarPorduct => _simillarPorduct;
  set simillarPorduct(String? simillarPorduct) =>
      _simillarPorduct = simillarPorduct;
  String? get similarDiscount => _similarDiscount;
  set similarDiscount(String? similarDiscount) =>
      _similarDiscount = similarDiscount;
  String? get sizeId => _sizeId;
  set sizeId(String? sizeId) => _sizeId = sizeId;
  String? get colorId => _colorId;
  set colorId(String? colorId) => _colorId = colorId;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  int? get subCategoryId => _subCategoryId;
  set subCategoryId(int? subCategoryId) => _subCategoryId = subCategoryId;
  int? get brandId => _brandId;
  set brandId(int? brandId) => _brandId = brandId;
  String? get discount => _discount;
  set discount(String? discount) => _discount = discount;
  String? get shortDetails => _shortDetails;
  set shortDetails(String? shortDetails) => _shortDetails = shortDetails;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get mainImage => _mainImage;
  set mainImage(String? mainImage) => _mainImage = mainImage;
  String? get thumbImage => _thumbImage;
  set thumbImage(String? thumbImage) => _thumbImage = thumbImage;
  String? get smallImage => _smallImage;
  set smallImage(String? smallImage) => _smallImage = smallImage;
  String? get sizeguide => _sizeguide;
  set sizeguide(String? sizeguide) => _sizeguide = sizeguide;
  String? get isFeature => _isFeature;
  set isFeature(String? isFeature) => _isFeature = isFeature;
  String? get isCollectionTitle1 => _isCollectionTitle1;
  set isCollectionTitle1(String? isCollectionTitle1) =>
      _isCollectionTitle1 = isCollectionTitle1;
  String? get isCollectionTitle2 => _isCollectionTitle2;
  set isCollectionTitle2(String? isCollectionTitle2) =>
      _isCollectionTitle2 = isCollectionTitle2;
  String? get isDeal => _isDeal;
  set isDeal(String? isDeal) => _isDeal = isDeal;
  String? get isTailoring => _isTailoring;
  set isTailoring(String? isTailoring) => _isTailoring = isTailoring;
  Null? get tailoringCharge => _tailoringCharge;
  set tailoringCharge(Null? tailoringCharge) =>
      _tailoringCharge = tailoringCharge;
  String? get isTrending => _isTrending;
  set isTrending(String? isTrending) => _isTrending = isTrending;
  String? get newArrival => _newArrival;
  set newArrival(String? newArrival) => _newArrival = newArrival;
  Null? get dealStart => _dealStart;
  set dealStart(Null? dealStart) => _dealStart = dealStart;
  Null? get dealEnd => _dealEnd;
  set dealEnd(Null? dealEnd) => _dealEnd = dealEnd;
  String? get rewardPoint => _rewardPoint;
  set rewardPoint(String? rewardPoint) => _rewardPoint = rewardPoint;
  int? get status => _status;
  set status(int? status) => _status = status;
  int? get quantity => _quantity;
  set quantity(int? quantity) => _quantity = quantity;
  String? get saveBy => _saveBy;
  set saveBy(String? saveBy) => _saveBy = saveBy;
  Null? get updateBy => _updateBy;
  set updateBy(Null? updateBy) => _updateBy = updateBy;
  String? get ipAddress => _ipAddress;
  set ipAddress(String? ipAddress) => _ipAddress = ipAddress;
  Null? get deletedAt => _deletedAt;
  set deletedAt(Null? deletedAt) => _deletedAt = deletedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  List<Sizes>? get sizes => _sizes;
  set sizes(List<Sizes>? sizes) => _sizes = sizes;
  List<Colorss>? get colors => _colors;
  set colors(List<Colorss>? colors) => _colors = colors;
  String? get currencyAmount => _currencyAmount;
  set currencyAmount(String? currencyAmount) =>
      _currencyAmount = currencyAmount;
  Category? get category => _category;
  set category(Category? category) => _category = category;

  AllProductData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _productCode = json['product_code'];
    _name = json['name'];
    _slug = json['slug'];
    _model = json['model'];
    _price = json['price'];
    _simillarPorduct = json['simillar_porduct'];
    _similarDiscount = json['similar_discount'];
    _sizeId = json['size_id'];
    _colorId = json['color_id'];
    _categoryId = json['category_id'];
    _subCategoryId = json['sub_category_id'];
    _brandId = json['brand_id'];
    _discount = json['discount'];
    _shortDetails = json['short_details'];
    _description = json['description'];
    _mainImage = json['main_image'];
    _thumbImage = json['thumb_image'];
    _smallImage = json['small_image'];
    _sizeguide = json['sizeguide'];
    _isFeature = json['is_feature'];
    _isCollectionTitle1 = json['is_collection_title_1'];
    _isCollectionTitle2 = json['is_collection_title_2'];
    _isDeal = json['is_deal'];
    _isTailoring = json['is_tailoring'];
    _tailoringCharge = json['tailoring_charge'];
    _isTrending = json['is_trending'];
    _newArrival = json['new_arrival'];
    _dealStart = json['deal_start'];
    _dealEnd = json['deal_end'];
    _rewardPoint = json['reward_point'];
    _status = json['status'];
    _quantity = json['quantity'];
    _saveBy = json['save_by'];
    _updateBy = json['update_by'];
    _ipAddress = json['ip_address'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['sizes'] != null) {
      _sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        _sizes!.add(new Sizes.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      _colors = <Colorss>[];
      json['colors'].forEach((v) {
        _colors!.add(new Colorss.fromJson(v));
      });
    }
    _currencyAmount = json['currency_amount'];
    _category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['product_code'] = this._productCode;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['model'] = this._model;
    data['price'] = this._price;
    data['simillar_porduct'] = this._simillarPorduct;
    data['similar_discount'] = this._similarDiscount;
    data['size_id'] = this._sizeId;
    data['color_id'] = this._colorId;
    data['category_id'] = this._categoryId;
    data['sub_category_id'] = this._subCategoryId;
    data['brand_id'] = this._brandId;
    data['discount'] = this._discount;
    data['short_details'] = this._shortDetails;
    data['description'] = this._description;
    data['main_image'] = this._mainImage;
    data['thumb_image'] = this._thumbImage;
    data['small_image'] = this._smallImage;
    data['sizeguide'] = this._sizeguide;
    data['is_feature'] = this._isFeature;
    data['is_collection_title_1'] = this._isCollectionTitle1;
    data['is_collection_title_2'] = this._isCollectionTitle2;
    data['is_deal'] = this._isDeal;
    data['is_tailoring'] = this._isTailoring;
    data['tailoring_charge'] = this._tailoringCharge;
    data['is_trending'] = this._isTrending;
    data['new_arrival'] = this._newArrival;
    data['deal_start'] = this._dealStart;
    data['deal_end'] = this._dealEnd;
    data['reward_point'] = this._rewardPoint;
    data['status'] = this._status;
    data['quantity'] = this._quantity;
    data['save_by'] = this._saveBy;
    data['update_by'] = this._updateBy;
    data['ip_address'] = this._ipAddress;
    data['deleted_at'] = this._deletedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._sizes != null) {
      data['sizes'] = this._sizes!.map((v) => v.toJson()).toList();
    }
    if (this._colors != null) {
      data['colors'] = this._colors!.map((v) => v.toJson()).toList();
    }
    data['currency_amount'] = this._currencyAmount;
    if (this._category != null) {
      data['category'] = this._category!.toJson();
    }
    return data;
  }
}

class Sizes {
  int? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;

  Sizes({int? id, String? name, String? createdAt, String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
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
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Sizes.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Colorss {
  int? _id;
  String? _name;
  String? _code;
  String? _createdAt;
  String? _updatedAt;

  Colorss(
      {int? id,
        String? name,
        String? code,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (code != null) {
      this._code = code;
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
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get code => _code;
  set code(String? code) => _code = code;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Colorss.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['code'] = this._code;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Category {
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

  Category(
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
        String? updatedAt}) {
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

  Category.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
