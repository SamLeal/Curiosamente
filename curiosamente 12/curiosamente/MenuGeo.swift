//
//  MenuGeo.swift
//  curiosamente
//
//  Created by Student02 on 09/05/23.
//

import SwiftUI

struct MenuGeo: View {
   @State var cor : Tema
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    var quizArray: [Quiz] = [Quizes.geoQUIZdefault,Quizes.geoQUIZdefault,Quizes.geoQUIZdefault,Quizes.geoQUIZdefault]
    
    @StateObject var model = QuizModel()

    
    var body: some View {
        NavigationStack{
            ZStack{
                
                cor.backgroundColor.ignoresSafeArea()
                VStack{
                    Text("Quizes Geografia")
                        .font(.largeTitle)
                        .padding()
                        .background(cor.detalhesColor)
                        .cornerRadius(15)
                        .foregroundColor(cor.textColor)
                        
                    ScrollView{
                        LazyVGrid(columns: columnLayout){
                            ForEach(model.questions, id: \._id){ q in
                                NavigationLink(destination : {
                                    
                                    MapQuiz2(cor: cor, quiz: q)
                                    
                                }){
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 25)
                                            .aspectRatio(1.0,contentMode: ContentMode.fit)
                                            .foregroundColor(cor.buttonColor)
                                        VStack{
                                            Text("\(q.categoria)")
                                                .font(.title)
                                                .foregroundColor(cor.textColor)
                                        }
                                    }
                                    
                                }
                            }.padding(5)
                        }
                    }
                    .padding()
                    .onAppear(){
                        cor = GLOBAL.tema
                        model.fetch(codigo: "quiz/geo")
                          
                    }
                }
            }
        }
    }
}
    struct MenuGeo_Previews: PreviewProvider {
        static var previews: some View {
            MenuGeo(cor: selectTema(tema: .temadf))
        }
    }

