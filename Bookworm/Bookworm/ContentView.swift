//
//  ContentView.swift
//  Bookworm
//
//  Created by 최정안 on 9/27/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [
        // 책의 제목으로 정렬한 후, 제목이 같은 경우 저자를 기준으로 다시 정렬
        SortDescriptor(\Book.title),
        SortDescriptor(\.author)
    ]) var books: [Book]
    
    @State private var showingAddScreen = false
    var body: some View {

        NavigationStack {
            List {
                ForEach(books) {
                    //SwiftData 모델들은 자동으로 Identifiable을 준수하기 때문에 ForEach에서 식별자를 따로 제공할 필요가 없다.
                    book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                        
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                    .foregroundStyle(book.rating == 1 ? .red : .black)
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
                
            }
                .navigationTitle("Bookworm")
                .navigationDestination(for: Book.self) {
                    book in
                    DetailView(book: book)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
        
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset] // Query에서 해당 책 찾기
            modelContext.delete(book) // context에서 해당 책 삭제
        }
    }
}

#Preview {
    ContentView()
}
