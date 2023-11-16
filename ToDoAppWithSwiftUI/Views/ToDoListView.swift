//
//  ToDoListItemView.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items : [ToDoListItem]
    
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "/users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in

                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button{
                                // Action
                                viewModel.deleteItemBy(id: item.id)
                            } label: {
                                //UI
                                Text("Delete")
                            }.tint(.red)
                        }

                }
                .listStyle(.plain)
                
               
                

                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    // Action here
                    viewModel.showingNewItemView = true
                    
                }label: {
                    //UI goes here
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "xFTmw3DUFgMSoQpefNNRPjotAt43")
    }
}
