

import SwiftUI

struct ButaoCalculadora: View {
    
    var texto = "default"
    @State var cor : Tema
    var custButtom : Color?
    
    var body: some View {
        Circle().overlay {
            Text("\(texto)").font(.largeTitle).foregroundColor(cor.textColor)
        }
        .foregroundColor(custButtom ?? cor.buttonColor)
        .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
        .frame(width: 90, height: 90, alignment: .center)
        
    }
}

struct MathQuiz: View {
    
    @State  var cor: Tema
    
    var quiz : Quiz
    
    @State var pergResp : PergResp = Quizes.dfMathQuiz
    
    @State var resp = ""
    
    @State var stat = Stats(pontos: 0, erros: 0, acertos: 0)
    @State var terminou = false
    @State var acertou = false
    @State var quizIndex = 0
    
    func nextQuiz(){
        
        if(quiz.pergResp.count>quizIndex){
            pergResp = quiz.pergResp[quizIndex]
            quizIndex += 1
            resp = ""
            
        }else{
            terminou = true
            print("teste")
        }
    }
    
    func numb(n:String){
        resp.append(n)
    }
    
    
    func conferirResultado(){
        let respostaCerta = pergResp.respostaCorreta
        
        if(respostaCerta.elementsEqual(resp)){
            acertou = true
            
            stat.pontos += 20
            stat.acertos += 1
            
            nextQuiz()
        }else{
            
            if(!resp.isEmpty){
                //stat.pontos -= 2
                stat.erros += 1
                
            }
            
            resp = ""
            
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
                    Text("\(quiz.descricao)  \(quizIndex) / \(quiz.pergResp.count)")
                        .font(.title)
                        .padding(.all,5)
                        .background(cor.detalhesColor)
                        .foregroundColor(cor.textColor)
                        .cornerRadius(20, antialiased: true)
                    
                    Spacer()
                    
                    Text("\(pergResp.pergunta) = \(resp)")
                        .foregroundColor(cor.textColor)
                        .font(.largeTitle)
                    
                    
                    
                    Spacer()
                    
                    VStack(spacing: 5){
                        HStack{
                            Button(action: {
                                numb(n: "7")
                            }, label: {
                                ButaoCalculadora(texto:"7",cor: cor)
                            })
                            Button(action: {
                                numb(n: "8")
                            }, label: {
                                ButaoCalculadora(texto:"8",cor: cor)
                            })
                            Button(action: {
                                numb(n: "9")
                            }, label: {
                                ButaoCalculadora(texto:"9",cor: cor)
                            })
                        }.padding(.horizontal, 10)
                        
                        HStack{
                            Button(action: {
                                numb(n: "4")
                            }, label: {
                                ButaoCalculadora(texto:"4",cor: cor)
                            })
                            Button(action: {
                                numb(n: "5")
                            }, label: {
                                ButaoCalculadora(texto:"5",cor: cor)
                            })
                            Button(action: {
                                numb(n: "6")
                            }, label: {
                                ButaoCalculadora(texto:"6",cor: cor)
                            })
                            
                        }.padding(.horizontal, 10)
                        HStack{
                            Button(action: {
                                numb(n: "1")
                            }, label: {
                                ButaoCalculadora(texto:"1",cor: cor)
                            })
                            Button(action: {
                                numb(n: "2")
                            }, label: {
                                ButaoCalculadora(texto:"2",cor: cor)
                            })
                            Button(action: {
                                numb(n: "3")
                            }, label: {
                                ButaoCalculadora(texto:"3",cor: cor)
                            })
                            
                        }.padding(.horizontal, 10)
                        HStack{
                            Button(action: {
                                numb(n: "0")
                            }, label: {
                                ButaoCalculadora(texto:"0",cor: cor)
                            })
                            Button(action: {
                                numb(n: ".")
                            }, label: {
                                
                                ButaoCalculadora(texto:".",cor: cor)
                            })
                            
                            Button(action: {
                                
                                conferirResultado()
                            }, label: {
                                ButaoCalculadora(texto:"=",cor: cor,custButtom: cor.detalhesColor)
                            })
                        }
                    }.padding(.bottom, 20)
                    
                }
            }.onAppear(){
                pergResp = quiz.pergResp[quizIndex]
                quizIndex += 1
                cor = GLOBAL.tema
            }
        }.navigationBarBackButtonHidden(true)
    }
}
struct MaphQuiz_Previews: PreviewProvider {
    static var previews: some View {
        MathQuiz(cor:selectTema(tema: .tema4) , quiz: Quizes.mathQUIZdefault)
    }
}
