/// code : "200"
/// message : "Success"
/// data : {"duration_tabs":["Short Term","Medium Term","Long Term","Intraday"],"signals":[{"id":1,"symbol":"AAPL","company_name":"Apple Inc.","logo_url":"https://logo.clearbit.com/apple.com","duration":"Short Term","current_price":189.5,"market_place":"NSE","gain_so_far":0.02,"potential_left":10.8},{"id":2,"symbol":"TSLA","company_name":"Tesla Inc.","logo_url":"https://logo.clearbit.com/tesla.com","duration":"Short Term","current_price":248.3,"market_place":"NSE","gain_so_far":1.45,"potential_left":16.79},{"id":3,"symbol":"META","company_name":"Meta Platforms","logo_url":"https://logo.clearbit.com/meta.com","duration":"Short Term","current_price":512.3,"market_place":"BSE","gain_so_far":0.35,"potential_left":8.25},{"id":4,"symbol":"GOOGL","company_name":"Alphabet Inc.","logo_url":"https://logo.clearbit.com/google.com","duration":"Medium Term","current_price":142.8,"market_place":"NSE","gain_so_far":0.08,"potential_left":15.55},{"id":5,"symbol":"AMZN","company_name":"Amazon.com Inc.","logo_url":"https://logo.clearbit.com/amazon.com","duration":"Medium Term","current_price":178.25,"market_place":"BSE","gain_so_far":0.95,"potential_left":12.2},{"id":6,"symbol":"MSFT","company_name":"Microsoft Corp.","logo_url":"https://logo.clearbit.com/microsoft.com","duration":"Medium Term","current_price":378.9,"market_place":"NSE","gain_so_far":0.42,"potential_left":7.63},{"id":7,"symbol":"JPM","company_name":"JPMorgan Chase","logo_url":"https://logo.clearbit.com/jpmorganchase.com","duration":"Long Term","current_price":198.4,"market_place":"NSE","gain_so_far":2.1,"potential_left":20.97},{"id":8,"symbol":"PFE","company_name":"Pfizer Inc.","logo_url":"https://logo.clearbit.com/pfizer.com","duration":"Long Term","current_price":28.45,"market_place":"BSE","gain_so_far":0.18,"potential_left":33.57},{"id":9,"symbol":"XOM","company_name":"Exxon Mobil","logo_url":"https://logo.clearbit.com/exxonmobil.com","duration":"Long Term","current_price":112.6,"market_place":"NSE","gain_so_far":1.62,"potential_left":19.89},{"id":10,"symbol":"NVDA","company_name":"NVIDIA Corp.","logo_url":"https://logo.clearbit.com/nvidia.com","duration":"Intraday","current_price":495.2,"market_place":"NSE","gain_so_far":0.04,"potential_left":2.99},{"id":11,"symbol":"NFLX","company_name":"Netflix Inc.","logo_url":"https://logo.clearbit.com/netflix.com","duration":"Intraday","current_price":485.7,"market_place":"BSE","gain_so_far":0.02,"potential_left":2.53},{"id":12,"symbol":"BAC","company_name":"Bank of America","logo_url":"https://logo.clearbit.com/bankofamerica.com","duration":"Intraday","current_price":38.2,"market_place":"NSE","gain_so_far":0.01,"potential_left":4.45}]}

class StockResponseModel {
  StockResponseModel({this.code, this.message, this.data});

  StockResponseModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? code;
  String? message;
  Data? data;
  StockResponseModel copyWith({String? code, String? message, Data? data}) =>
      StockResponseModel(code: code ?? this.code, message: message ?? this.message, data: data ?? this.data);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// duration_tabs : ["Short Term","Medium Term","Long Term","Intraday"]
/// signals : [{"id":1,"symbol":"AAPL","company_name":"Apple Inc.","logo_url":"https://logo.clearbit.com/apple.com","duration":"Short Term","current_price":189.5,"market_place":"NSE","gain_so_far":0.02,"potential_left":10.8},{"id":2,"symbol":"TSLA","company_name":"Tesla Inc.","logo_url":"https://logo.clearbit.com/tesla.com","duration":"Short Term","current_price":248.3,"market_place":"NSE","gain_so_far":1.45,"potential_left":16.79},{"id":3,"symbol":"META","company_name":"Meta Platforms","logo_url":"https://logo.clearbit.com/meta.com","duration":"Short Term","current_price":512.3,"market_place":"BSE","gain_so_far":0.35,"potential_left":8.25},{"id":4,"symbol":"GOOGL","company_name":"Alphabet Inc.","logo_url":"https://logo.clearbit.com/google.com","duration":"Medium Term","current_price":142.8,"market_place":"NSE","gain_so_far":0.08,"potential_left":15.55},{"id":5,"symbol":"AMZN","company_name":"Amazon.com Inc.","logo_url":"https://logo.clearbit.com/amazon.com","duration":"Medium Term","current_price":178.25,"market_place":"BSE","gain_so_far":0.95,"potential_left":12.2},{"id":6,"symbol":"MSFT","company_name":"Microsoft Corp.","logo_url":"https://logo.clearbit.com/microsoft.com","duration":"Medium Term","current_price":378.9,"market_place":"NSE","gain_so_far":0.42,"potential_left":7.63},{"id":7,"symbol":"JPM","company_name":"JPMorgan Chase","logo_url":"https://logo.clearbit.com/jpmorganchase.com","duration":"Long Term","current_price":198.4,"market_place":"NSE","gain_so_far":2.1,"potential_left":20.97},{"id":8,"symbol":"PFE","company_name":"Pfizer Inc.","logo_url":"https://logo.clearbit.com/pfizer.com","duration":"Long Term","current_price":28.45,"market_place":"BSE","gain_so_far":0.18,"potential_left":33.57},{"id":9,"symbol":"XOM","company_name":"Exxon Mobil","logo_url":"https://logo.clearbit.com/exxonmobil.com","duration":"Long Term","current_price":112.6,"market_place":"NSE","gain_so_far":1.62,"potential_left":19.89},{"id":10,"symbol":"NVDA","company_name":"NVIDIA Corp.","logo_url":"https://logo.clearbit.com/nvidia.com","duration":"Intraday","current_price":495.2,"market_place":"NSE","gain_so_far":0.04,"potential_left":2.99},{"id":11,"symbol":"NFLX","company_name":"Netflix Inc.","logo_url":"https://logo.clearbit.com/netflix.com","duration":"Intraday","current_price":485.7,"market_place":"BSE","gain_so_far":0.02,"potential_left":2.53},{"id":12,"symbol":"BAC","company_name":"Bank of America","logo_url":"https://logo.clearbit.com/bankofamerica.com","duration":"Intraday","current_price":38.2,"market_place":"NSE","gain_so_far":0.01,"potential_left":4.45}]

class Data {
  Data({this.durationTabs, this.signals});

  Data.fromJson(dynamic json) {
    durationTabs = json['duration_tabs'] != null ? json['duration_tabs'].cast<String>() : [];
    if (json['signals'] != null) {
      signals = [];
      json['signals'].forEach((v) {
        signals?.add(Signals.fromJson(v));
      });
    }
  }
  List<String>? durationTabs;
  List<Signals>? signals;
  Data copyWith({List<String>? durationTabs, List<Signals>? signals}) =>
      Data(durationTabs: durationTabs ?? this.durationTabs, signals: signals ?? this.signals);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['duration_tabs'] = durationTabs;
    if (signals != null) {
      map['signals'] = signals?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// symbol : "AAPL"
/// company_name : "Apple Inc."
/// logo_url : "https://logo.clearbit.com/apple.com"
/// duration : "Short Term"
/// current_price : 189.5
/// market_place : "NSE"
/// gain_so_far : 0.02
/// potential_left : 10.8

class Signals {
  Signals({
    this.id,
    this.symbol,
    this.companyName,
    this.logoUrl,
    this.duration,
    this.currentPrice,
    this.marketPlace,
    this.gainSoFar,
    this.potentialLeft,
  });

  Signals.fromJson(dynamic json) {
    id = json['id'];
    symbol = json['symbol'];
    companyName = json['company_name'];
    logoUrl = json['logo_url'];
    duration = json['duration'];
    currentPrice = json['current_price'];
    marketPlace = json['market_place'];
    gainSoFar = json['gain_so_far'];
    potentialLeft = json['potential_left'];
  }
  int? id;
  String? symbol;
  String? companyName;
  String? logoUrl;
  String? duration;
  double? currentPrice;
  String? marketPlace;
  double? gainSoFar;
  double? potentialLeft;
  Signals copyWith({
    int? id,
    String? symbol,
    String? companyName,
    String? logoUrl,
    String? duration,
    double? currentPrice,
    String? marketPlace,
    double? gainSoFar,
    double? potentialLeft,
  }) => Signals(
    id: id ?? this.id,
    symbol: symbol ?? this.symbol,
    companyName: companyName ?? this.companyName,
    logoUrl: logoUrl ?? this.logoUrl,
    duration: duration ?? this.duration,
    currentPrice: currentPrice ?? this.currentPrice,
    marketPlace: marketPlace ?? this.marketPlace,
    gainSoFar: gainSoFar ?? this.gainSoFar,
    potentialLeft: potentialLeft ?? this.potentialLeft,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['symbol'] = symbol;
    map['company_name'] = companyName;
    map['logo_url'] = logoUrl;
    map['duration'] = duration;
    map['current_price'] = currentPrice;
    map['market_place'] = marketPlace;
    map['gain_so_far'] = gainSoFar;
    map['potential_left'] = potentialLeft;
    return map;
  }
}
