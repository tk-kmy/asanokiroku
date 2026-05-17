import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "sun.haze")
                    .imageScale(.large)
                    .font(.system(size: 64))
                    .foregroundStyle(.orange)
                Text("あさのきろく")
                    .font(.largeTitle)
                    .bold()
                Text("セットアップ完了")
                    .foregroundStyle(.secondary)
            }
            .padding()
            .navigationTitle("ホーム")
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
