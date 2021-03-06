//
//  ContentView.swift
//  Recipe List App
//
//  Created by Callum Day Ham on 5/18/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .center){
                
                Text("All Recipes")
                    .bold()
                    .font(.custom("Avenir Heavy", size: 32))
                
                ScrollView{
                    LazyVStack(alignment: .leading){
                        ForEach(model.recipes){ r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe:r),
                                label: {
                                    HStack(spacing: 10){
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height:60, alignment: .center)
                                            .clipped()
                                            .cornerRadius(3.0)
                                        
                                        VStack(alignment: .leading){
                                        Text(r.name)
                                            .font(.custom("Avenir Heavy", size: 24))
                                            .fontWeight(.bold)
                                            .fixedSize()
                                            .foregroundColor(.black)
                                            
                                            RecipeHighlightsView(highlights: r.highlights)
                                                .foregroundColor(.black)

                                    }
                                    }
                                })
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
