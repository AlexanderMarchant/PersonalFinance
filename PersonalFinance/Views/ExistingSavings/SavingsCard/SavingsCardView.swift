//
//  SavingsCardView.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import SwiftUI

struct SavingsCardView: View {
    
    @Binding var editingIsEnabled: Bool
    
    @State private var translation: CGSize = .zero
    
    @State var showingAlert = false
    @State private var buttonOpactity: Double = 0.0
    @State private var buttonScale: Double = 0.1
    
    @ObservedObject var savingsCardViewModel: SavingsCardViewModel
    
    var body: some View {
        ZStack {
            HStack(spacing: 10) {
                Spacer()
                PFActionButton(
                    buttonImage: "close-icon",
                    backgroundColour: Color.red,
                    action: {
                        self.showingAlert = true
                    })
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Delete Savings Account"),
                            message: Text("Are you sure you want to delete this savings account?"),
                            primaryButton: .destructive(Text("Yes"), action: resetCardState),
                            secondaryButton: .cancel(resetCardState))
                        
                        // On delete, bubble this up and remove the account from the list
                        
                    }
                    .opacity(buttonOpactity)
                    .scaleEffect(CGSize(width: buttonScale, height: buttonScale))
                
                PFActionButton(
                    buttonImage: "edit-icon",
                    backgroundColour: Color.orange,
                    action: {})
                    .opacity(buttonOpactity)
                    .scaleEffect(CGSize(width: buttonScale, height: buttonScale))
                
                PFActionButton(
                    buttonImage: "forward-icon",
                    backgroundColour: Color.blue,
                    action: resetCardState)
                    .opacity(buttonOpactity)
                    .scaleEffect(CGSize(width: buttonScale, height: buttonScale))
            }
            .padding(.trailing, 15)
            
            GeometryReader { geometry in
                HStack {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        PFSubTitleTextView(text: savingsCardViewModel.balance)
                        
                        Text(savingsCardViewModel.name)
                            .font(.headline)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text(savingsCardViewModel.interestType ?? "")
                            .font(.headline)
                        PFBodyTextView(text: savingsCardViewModel.interest ?? "")
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 3)
                .offset(x: self.translation.width, y: 0)
                .gesture(
                    DragGesture()
                        
                        .onChanged { value in
                            if(!self.editingIsEnabled) { return }
                            
                            if(buttonOpactity < 1.0) {
                                self.translation = value.translation
                                
                                
                                if(self.translation.width < -200) {
                                    self.buttonOpactity = 1.0
                                }
                                
                                self.buttonOpactity =  -Double(value.translation.width / 250)
                                
                                self.buttonScale = 0.1 + buttonOpactity
                            } else {
                                
                                
                                if(value.translation.width > 0) {
                                    resetCardState()
                                }
                            }
                            
                        }.onEnded { value in
                            
                            if(!self.editingIsEnabled) { return }
                            
                            if(self.translation.width < -150) {
                                self.buttonOpactity = 1.0
                                withAnimation {
                                    self.translation.width = -205
                                    self.buttonScale = 1.0
                                }
                            } else {
                                resetCardState()
                            }
                            
                        }
                )
            }
            .frame(height: 100)
            .padding(.horizontal, 15)
        }
    }
    
    func resetCardState() {
        withAnimation {
            self.translation = .zero
            self.buttonOpactity = 0.0
            self.buttonScale = 0.1
        }
    }
}

struct SavingsCardView_Previews: PreviewProvider {
    static var previews: some View {
        SavingsCardView(editingIsEnabled: Binding<Bool>.constant(false), savingsCardViewModel: SavingsCardViewModel(
                            Account(
                                name: "Testing",
                                balance: 11000.11,
                                interest: 6.34,
                                fixedInterest: false,
                                currency: .GBP)))
    }
}
