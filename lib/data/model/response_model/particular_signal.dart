/// code : "200"
/// message : "Success"
/// data : {"signal":{"id":3,"symbol":"META","company_name":"Meta Platforms","logo_url":"https://logo.clearbit.com/meta.com","sector":["Technology","Large Cap"],"current_price":512.3,"change_percent":-0.87,"change_amount":-4.5,"type":"Equity","product_type":["Intraday","Margin","Delivery"],"order_type":["Market","Limit"],"order_summary":{"entry_range":"530-512.3","target_price":470,"stop_loss":530,"trading_capital":"10.1k","per_trade_risk":"500","per_trade_percentage_risk":"5%","trade_risk":"500","quantity_to_trade":"2","potential_profit":"-84.6","margin_required":"204.92","margin_available":"5.8k"}}}

class ParticularSignal {
  ParticularSignal({this.code, this.message, this.data});

  ParticularSignal.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? code;
  String? message;
  Data? data;
  ParticularSignal copyWith({String? code, String? message, Data? data}) =>
      ParticularSignal(code: code ?? this.code, message: message ?? this.message, data: data ?? this.data);
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

/// signal : {"id":3,"symbol":"META","company_name":"Meta Platforms","logo_url":"https://logo.clearbit.com/meta.com","sector":["Technology","Large Cap"],"current_price":512.3,"change_percent":-0.87,"change_amount":-4.5,"type":"Equity","product_type":["Intraday","Margin","Delivery"],"order_type":["Market","Limit"],"order_summary":{"entry_range":"530-512.3","target_price":470,"stop_loss":530,"trading_capital":"10.1k","per_trade_risk":"500","per_trade_percentage_risk":"5%","trade_risk":"500","quantity_to_trade":"2","potential_profit":"-84.6","margin_required":"204.92","margin_available":"5.8k"}}

class Data {
  Data({this.signal});

  Data.fromJson(dynamic json) {
    signal = json['signal'] != null ? Signal.fromJson(json['signal']) : null;
  }
  Signal? signal;
  Data copyWith({Signal? signal}) => Data(signal: signal ?? this.signal);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (signal != null) {
      map['signal'] = signal?.toJson();
    }
    return map;
  }
}

/// id : 3
/// symbol : "META"
/// company_name : "Meta Platforms"
/// logo_url : "https://logo.clearbit.com/meta.com"
/// sector : ["Technology","Large Cap"]
/// current_price : 512.3
/// change_percent : -0.87
/// change_amount : -4.5
/// type : "Equity"
/// product_type : ["Intraday","Margin","Delivery"]
/// order_type : ["Market","Limit"]
/// order_summary : {"entry_range":"530-512.3","target_price":470,"stop_loss":530,"trading_capital":"10.1k","per_trade_risk":"500","per_trade_percentage_risk":"5%","trade_risk":"500","quantity_to_trade":"2","potential_profit":"-84.6","margin_required":"204.92","margin_available":"5.8k"}

class Signal {
  Signal({
    this.id,
    this.symbol,
    this.companyName,
    this.logoUrl,
    this.sector,
    this.currentPrice,
    this.changePercent,
    this.changeAmount,
    this.type,
    this.productType,
    this.orderType,
    this.orderSummary,
  });

  Signal.fromJson(dynamic json) {
    id = json['id'];
    symbol = json['symbol'];
    companyName = json['company_name'];
    logoUrl = json['logo_url'];
    sector = json['sector'] != null ? json['sector'].cast<String>() : [];
    currentPrice = json['current_price'];
    changePercent = json['change_percent'];
    changeAmount = json['change_amount'];
    type = json['type'];
    productType = json['product_type'] != null ? json['product_type'].cast<String>() : [];
    orderType = json['order_type'] != null ? json['order_type'].cast<String>() : [];
    orderSummary = json['order_summary'] != null ? OrderSummary.fromJson(json['order_summary']) : null;
  }
  int? id;
  String? symbol;
  String? companyName;
  String? logoUrl;
  List<String>? sector;
  double? currentPrice;
  double? changePercent;
  double? changeAmount;
  String? type;
  List<String>? productType;
  List<String>? orderType;
  OrderSummary? orderSummary;
  Signal copyWith({
    int? id,
    String? symbol,
    String? companyName,
    String? logoUrl,
    List<String>? sector,
    double? currentPrice,
    double? changePercent,
    double? changeAmount,
    String? type,
    List<String>? productType,
    List<String>? orderType,
    OrderSummary? orderSummary,
  }) => Signal(
    id: id ?? this.id,
    symbol: symbol ?? this.symbol,
    companyName: companyName ?? this.companyName,
    logoUrl: logoUrl ?? this.logoUrl,
    sector: sector ?? this.sector,
    currentPrice: currentPrice ?? this.currentPrice,
    changePercent: changePercent ?? this.changePercent,
    changeAmount: changeAmount ?? this.changeAmount,
    type: type ?? this.type,
    productType: productType ?? this.productType,
    orderType: orderType ?? this.orderType,
    orderSummary: orderSummary ?? this.orderSummary,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['symbol'] = symbol;
    map['company_name'] = companyName;
    map['logo_url'] = logoUrl;
    map['sector'] = sector;
    map['current_price'] = currentPrice;
    map['change_percent'] = changePercent;
    map['change_amount'] = changeAmount;
    map['type'] = type;
    map['product_type'] = productType;
    map['order_type'] = orderType;
    if (orderSummary != null) {
      map['order_summary'] = orderSummary?.toJson();
    }
    return map;
  }
}

/// entry_range : "530-512.3"
/// target_price : 470
/// stop_loss : 530
/// trading_capital : "10.1k"
/// per_trade_risk : "500"
/// per_trade_percentage_risk : "5%"
/// trade_risk : "500"
/// quantity_to_trade : "2"
/// potential_profit : "-84.6"
/// margin_required : "204.92"
/// margin_available : "5.8k"

class OrderSummary {
  OrderSummary({
    this.entryRange,
    this.targetPrice,
    this.stopLoss,
    this.tradingCapital,
    this.perTradeRisk,
    this.perTradePercentageRisk,
    this.tradeRisk,
    this.quantityToTrade,
    this.potentialProfit,
    this.marginRequired,
    this.marginAvailable,
  });

  OrderSummary.fromJson(dynamic json) {
    entryRange = json['entry_range'];
    targetPrice = json['target_price'];
    stopLoss = json['stop_loss'];
    tradingCapital = json['trading_capital'];
    perTradeRisk = json['per_trade_risk'];
    perTradePercentageRisk = json['per_trade_percentage_risk'];
    tradeRisk = json['trade_risk'];
    quantityToTrade = json['quantity_to_trade'];
    potentialProfit = json['potential_profit'];
    marginRequired = json['margin_required'];
    marginAvailable = json['margin_available'];
  }
  String? entryRange;
  int? targetPrice;
  int? stopLoss;
  String? tradingCapital;
  String? perTradeRisk;
  String? perTradePercentageRisk;
  String? tradeRisk;
  String? quantityToTrade;
  String? potentialProfit;
  String? marginRequired;
  String? marginAvailable;
  OrderSummary copyWith({
    String? entryRange,
    int? targetPrice,
    int? stopLoss,
    String? tradingCapital,
    String? perTradeRisk,
    String? perTradePercentageRisk,
    String? tradeRisk,
    String? quantityToTrade,
    String? potentialProfit,
    String? marginRequired,
    String? marginAvailable,
  }) => OrderSummary(
    entryRange: entryRange ?? this.entryRange,
    targetPrice: targetPrice ?? this.targetPrice,
    stopLoss: stopLoss ?? this.stopLoss,
    tradingCapital: tradingCapital ?? this.tradingCapital,
    perTradeRisk: perTradeRisk ?? this.perTradeRisk,
    perTradePercentageRisk: perTradePercentageRisk ?? this.perTradePercentageRisk,
    tradeRisk: tradeRisk ?? this.tradeRisk,
    quantityToTrade: quantityToTrade ?? this.quantityToTrade,
    potentialProfit: potentialProfit ?? this.potentialProfit,
    marginRequired: marginRequired ?? this.marginRequired,
    marginAvailable: marginAvailable ?? this.marginAvailable,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['entry_range'] = entryRange;
    map['target_price'] = targetPrice;
    map['stop_loss'] = stopLoss;
    map['trading_capital'] = tradingCapital;
    map['per_trade_risk'] = perTradeRisk;
    map['per_trade_percentage_risk'] = perTradePercentageRisk;
    map['trade_risk'] = tradeRisk;
    map['quantity_to_trade'] = quantityToTrade;
    map['potential_profit'] = potentialProfit;
    map['margin_required'] = marginRequired;
    map['margin_available'] = marginAvailable;
    return map;
  }
}
