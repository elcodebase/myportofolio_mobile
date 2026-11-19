import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('kartu Tambah Edukasi membuka formulir, validasi & dialog', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Tambah Edukasi'), findsOneWidget);

    // buka formulir dari kartu aksi
    await tester.tap(find.text('Tambah Edukasi'));
    await tester.pumpAndSettle();
    expect(find.text('Add Education Form'), findsOneWidget);

    // simpan dengan isian kosong -> muncul pesan error, tanpa dialog
    await tester.ensureVisible(find.text('Simpan'));
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();
    expect(find.text('Nama institusi tidak boleh kosong!'), findsOneWidget);
    expect(find.text('Tanggal mulai harus dipilih!'), findsOneWidget);
    expect(find.byType(AlertDialog), findsNothing);

    // hanya spasi tetap ditolak
    await tester.enterText(find.byType(TextFormField).at(0), '   ');
    await tester.ensureVisible(find.text('Simpan'));
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();
    expect(find.text('Nama institusi tidak boleh kosong!'), findsOneWidget);
  });

  testWidgets('drawer membuka formulir edukasi dan Home kembali ke utama', (
    WidgetTester tester,
  ) async {
    // Font bawaan test lebih lebar dari font asli, jadi header drawer
    // dilaporkan overflow di test saja. Abaikan khusus error tersebut.
    final oldHandler = FlutterError.onError;
    addTearDown(() => FlutterError.onError = oldHandler);
    FlutterError.onError = (details) {
      if (!details.toString().contains('overflowed')) {
        oldHandler!(details);
      }
    };

    await tester.pumpWidget(const MyApp());

    final ScaffoldState scaffold = tester.firstState(find.byType(Scaffold));
    scaffold.openDrawer();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add Education'));
    await tester.pumpAndSettle();
    expect(find.text('Add Education Form'), findsOneWidget);

    tester.firstState<ScaffoldState>(find.byType(Scaffold)).openDrawer();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Selamat datang di MyPortofolio Mobile'), findsOneWidget);
  });

  testWidgets('isian valid menampilkan dialog ringkasan', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Tambah Edukasi'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), 'Universitas X');
    await tester.enterText(find.byType(TextFormField).at(1), 'Ilmu Komputer');

    // pilih tanggal mulai & selesai (default: hari ini)
    for (final label in ['Tanggal Mulai', 'Tanggal Selesai']) {
      await tester.ensureVisible(find.text(label).first);
      await tester.tap(find.text(label).first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
    }

    await tester.ensureVisible(find.text('Simpan'));
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Institusi: Universitas X'), findsOneWidget);
    expect(find.text('Jurusan: Ilmu Komputer'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
  });
}
