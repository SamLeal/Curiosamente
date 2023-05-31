import SwiftUI
struct TextQuiz: View {
    
    
    
    
    @State var terminou : Bool = false
    
  @State  var cor : Tema
    
    var quiz : Quiz
    
    @State var stat = Stats(pontos: 0, erros: 0, acertos: 0)
    
    @State var pergResp : PergResp = Quizes.dfTextQuiz
    @State var respostas : [Resposta] = []
    
    @State var respondeu = false
    
    @State var quizIndex = 0
    
    func randResps() -> [Resposta]{
        
        var arrayResp : [Resposta] = []
        arrayResp.append(Resposta(string: pergResp.respostaCorreta, isCorrect: true))
        
        let respErradas = pergResp.respostasErradas
         
        for resp in respErradas{
            arrayResp.append(Resposta(string: resp, isCorrect: false))
        }
        
        arrayResp.shuffle()
        
        return arrayResp
    }
    
    func nextQuiz(){
        if(quiz.pergResp.count>quizIndex){
            pergResp = quiz.pergResp[quizIndex]
            respostas = randResps()
            quizIndex += 1
            respondeu = false
        }else{
            terminou = true
           // stat.pontos += 10000
            print("teste")
        }
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
            
                NavigationLink(destination: ResultadosQuiz(cor: cor, quizName: quiz.categoria, quizPoints: stat), isActive: $terminou) {
                    EmptyView()
                }.hidden()
                
                
                cor.backgroundColor.ignoresSafeArea()
                VStack{
                    Text("\(quiz.descricao) - \(quizIndex)/\(quiz.pergResp.count)")
                        .font(.title)
                        .foregroundColor(cor.textColor)
                    
                    
                    Spacer()
                    Text(respondeu ? pergResp.descricao : pergResp.pergunta)
                    
                        .font(.largeTitle)
                        .foregroundColor(cor.textColor)
                        .padding(.all, 20)
                        .background(cor.detalhesColor)
                        .cornerRadius(20)
                    
                    Spacer()
                    VStack{
                       
                        
                        ForEach(respostas, id: \.string) {
                            resp in
                            Button(action: {
                                if(!respondeu)
                                {
                                    if(resp.isCorrect){
                                        stat.pontos += 20
                                        stat.acertos += 1
                                        
                                    }else{
                                        //stat.pontos -= 2
                                        stat.erros += 1
                                    }
                                    respondeu = true
                                }else{
                                    nextQuiz()
                                }
                                
                                
                                
                            }, label: {
                                HStack{
                                    Spacer()
                                    Text(resp.string)
                                        .foregroundColor(cor.textColor)
                                        .font(.largeTitle)
                                    Spacer()
                                }
                                
                                .padding(.all,2)
                                .background(respondeu ? (resp.isCorrect ? .green : .red) : cor.buttonColor)
                                .cornerRadius(25)
                            })
                            
                        }
                        
                        
                    }
                    .padding(.all, 10.0)
                    .background(cor.detalhesColor)
                    .cornerRadius(25)
                }
            }.onAppear(perform: {
                pergResp = quiz.pergResp[quizIndex]
                respostas = randResps()
                quizIndex += 1
                cor = GLOBAL.tema  
            })
        }.navigationBarBackButtonHidden(true)
    
}
}

struct TextQuiz_Previews: PreviewProvider {
    static var previews: some View {
        TextQuiz(cor: selectTema(tema: .temadf), quiz: Quizes.textQUIZdefault)
    }
}
