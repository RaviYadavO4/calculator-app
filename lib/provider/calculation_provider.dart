import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculationProvider extends ChangeNotifier {
  List<String> _dataList = ['0'];
  String _prevData = ' ';
  bool _isSign = false;
  bool _isResult = false;

  String get data => _dataList.join(' ');
  String get prevData => _prevData;

  String get _equation => data
      .replaceAll('\u00F7', '/')
      .replaceAll('\u00D7', '*')
      .replaceAll('\u2212', '-');

  void addNumber(String number) {
    if (_isResult || (_dataList.length == 1 && _dataList.last == '0')) {
      _dataList = [number];
      _isResult = false;
    } else if (_isSign) {
      _dataList.add(number);
      _isSign = false;
    } else if (_dataList.last.startsWith('(')) {
      final temp = _dataList.last.substring(0, _dataList.last.length - 1);
      _dataList.last = '$temp$number)';
    } else {
      _dataList.last += number;
    }

    notifyListeners();
  }

  void addSign(String sign) {
    _isResult = false;

    switch (sign) {
      case '+/\u2212':
        _toggleNegation();
        break;

      case '%':
        _applyPercentage();
        break;

      case '.':
        _addDecimalPoint();
        break;

      case 'C':
        _clearAll();
        break;

      case '=':
        _evaluateExpression();
        break;

      default:
        _addOperator(sign);
        break;
    }

    notifyListeners();
  }

  void _toggleNegation() {
    if (_isSign) return;

    if (_dataList.last.startsWith('(')) {
      _dataList.last = _dataList.last.substring(2, _dataList.last.length - 1);
    } else if (_dataList.last.startsWith('-')) {
      _dataList.last = '(${_dataList.last})';
    } else {
      _dataList.last = '(-${_dataList.last})';
    }
  }

  void _applyPercentage() {
    if (_isSign) return;

    final result = _dataList.last.interpret() * 0.01;
    _dataList.last = result < 0 ? '($result)' : result.toString();
  }

  void _addDecimalPoint() {
    if (_dataList.last.contains('.')) return;

    if (_isSign) {
      _dataList.add('0');
      _isSign = false;
    }

    if (_dataList.last.startsWith('(')) {
      final temp = _dataList.last.substring(0, _dataList.last.length - 1);
      _dataList.last = '$temp.)';
    } else {
      _dataList.last += '.';
    }
  }

  void _clearAll() {
    _dataList = ['0'];
    _prevData = ' ';
    _isSign = false;
  }

  void _evaluateExpression() {
    _prevData = data;

    final result = _equation.interpret();
    _dataList = [
      result % 1 == 0 ? result.toInt().toString() : result.toString(),
    ];
    _isResult = true;
  }

  void _addOperator(String sign) {
    if (_isSign) {
      _dataList.last = sign;
    } else {
      _dataList.add(sign);
      _isSign = true;
    }
  }
}
