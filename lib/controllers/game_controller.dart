import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/core/constant/cell_constant.dart';
import 'package:ledoyun2/game_screen/widgets/cell.dart';

class GameController extends GetxController {
  //final TimerState timerController = Get.put(TimerState());

  List<List<int>> _board = RxList<List<int>>();
  // ignore: invalid_use_of_protected_member
  List<List<int>> get board => _board.toList();
  set board(List<List<int>> value) => _board = value;
  Random random = Random();
  int _ledSayisi = CellConstant.instance.ledSayisi;
  int _index;
  RxInt _rastgeleSayi = 0.obs;
  final player = AudioCache();

  RxBool _ses = false.obs;
  bool get ses => _ses.value;
  set ses(bool value) => _ses.value = value;
  void sesAcKapat() {
    _ses.value = !_ses.value;
    print('ses : $ses');
  }

  RxBool _bebekmod = false.obs;
  bool get bebekmod => _bebekmod.value;
  set bebekmod(bool value) => _bebekmod.value = value;
  void bebekmodAcKapat() {
    _bebekmod.value = !_bebekmod.value;
    print('bebekmod : $bebekmod');
  }

  RxInt _hizZaman = 500.obs;
  int get hizZaman => _hizZaman.value;
  set hizZaman(int value) => _hizZaman.value = value;
  void hizlan(int value) {
    if (_hizZaman.value > 50) _hizZaman.value -= value;
    print('hizZaman : $hizZaman');
  }

  void hizZamanReset() => _hizZaman.value = 500;

  void _gameBoard() {
    RastgeleSayiUret();
    int r = rastgeleSayi;
    print('Rastgele :$r');
    board[0][r] = 2;
    update();
  }

  RxInt _tick = 0.obs;
  int get tick => _tick.value;
  set tick(int value) => _tick.value = value;
  void tickArtir() {
    _tick.value += 1;
    print('Tick : $tick');
    _index = _tick.value % _ledSayisi;
    dondur();
  }

  RxInt _level = 1.obs;
  int get level => _level.value;
  set level(int value) => _level.value = value;
  void levelArtir() {
    _level.value += 1;
    print('Level : $level');
  }

  int get rastgeleSayi => _rastgeleSayi.value;
  // ignore: non_constant_identifier_names
  void RastgeleSayiUret() {
    _rastgeleSayi.value = random.nextInt(_ledSayisi);
    // print('RastgeleSayi : $RastgeleSayi');
  }

  RxInt _hiz = 50.obs;
  int get hiz => _hiz.value;
  set hiz(int value) => _hiz.value = value;
  void hizArtir(int value) {
    _hiz.value += value;
    print('Hız : $hiz');
  }

  RxInt _puan = 0.obs;
  int get puan => _puan.value;
  set puan(int value) => _puan.value = value;
  void puanArtir(int value) {
    _puan.value += value;
    print('Puan : $puan');
  }

  RxInt _hata = 0.obs;
  int get hata => _hata.value;
  set hata(int value) => _hata.value = value;
  void hataArtir(int value) {
    _hata.value += value;
    print('Hata : $hata');
  }

  void _buildBoard() {
    board = [List.filled(_ledSayisi, 0)];
    // _hiz.value =  50;
    //update();
  }

  @override
  void onInit() {
    super.onInit();
    _buildBoard();
    _gameBoard();
    // print(board);
    board[0][0] = 1;
  }

  int winner = 0;
  void declareWinner() {
    Get.defaultDialog(
      //backgroundColor: ColorConstants.instance.bgColor,
      title: _hata.value == 0
          ? 'MÜKEMMEL'
          : _hata.value == 1
              ? 'SüPER'
              : _hata.value == 2
                  ? 'BRAVO'
                  : ' OYUN BİTTİ !!! \nPuanınız : $puan',
      content: _hata.value == 0
          ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cell(
                  currentCellMode:
                      winner == 1 ? cellMode.YELLOW : cellMode.RED),
              Cell(
                  currentCellMode:
                      winner == 1 ? cellMode.YELLOW : cellMode.RED),
              Cell(
                  currentCellMode:
                      winner == 1 ? cellMode.YELLOW : cellMode.RED),
            ])
          : _hata.value == 1
              ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Cell(
                      currentCellMode:
                          winner == 1 ? cellMode.YELLOW : cellMode.RED),
                  Cell(
                      currentCellMode:
                          winner == 1 ? cellMode.YELLOW : cellMode.RED)
                ])
              : Cell(
                  currentCellMode:
                      winner == 1 ? cellMode.YELLOW : cellMode.RED),
    ).then((value) => winner == 1 ? nextLevel() : resetLevel());
  }

  void resetLevel() {
    resetGame();
    print('reset game');
  }

  void nextLevel() {
    _buildBoard();
    _gameBoard();
    _puan.value = (_level.value * 3 - _hata.value);
    _hata.value = 0;
    if (_bebekmod.value == false) {
      print('bebek mod kapalı');
      _hizZaman.value <= 200 ? hizlan(10) : hizlan(100);
      _hiz.value = _level.value * 50;
    }
    levelArtir();
  }

  void dondur() {
    int targetIndex = board[0].indexOf(2);
    board = [List.filled(_ledSayisi, 0)];
    board[0][targetIndex] = 2;
    if (_index != targetIndex) board[0][_index] = 1;
    update();
    if(_ses.value == true)player.play('sesler/tick.wav');
  }

  void durumKontrol() {
    //print('RastgeleSayi: $RastgeleSayi- index : $_index');
    if (_index == rastgeleSayi) {
      winner = 1;
      declareWinner();
    } else {
      hataArtir(1);
      _buildBoard();
      _gameBoard();
      if (_hata.value == 3) {
        winner = 0;
       if(_ses.value == true)player.play('sesler/error.mp3');
        declareWinner();
      }
    }
  }

  void resetGame() {
    _buildBoard();
    _gameBoard();
    _level.value = 1;
    _hata.value = 0;
    _puan.value = 0;
    _hiz.value = 50;
    hizZamanReset();
  }
}
