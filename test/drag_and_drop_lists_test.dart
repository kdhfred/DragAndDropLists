import 'package:drag_and_drop_lists/programmatic_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ProgrammaticExpansionTile respects expansionDuration',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Center(
            child: SizedBox(
              width: 300,
              child: ProgrammaticExpansionTile(
                key: GlobalKey(),
                listKey: const PageStorageKey<String>('tile'),
                title: const Text('Folder'),
                expansionDuration: const Duration(milliseconds: 1),
                children: const [
                  SizedBox(height: 100, child: Text('Child')),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    final closedHeight = tester
        .getSize(find.byType(ProgrammaticExpansionTile))
        .height;

    await tester.tap(find.text('Folder'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1));

    final expandedHeight = tester
        .getSize(find.byType(ProgrammaticExpansionTile))
        .height;

    expect(expandedHeight, greaterThan(closedHeight + 90));
  });
}
