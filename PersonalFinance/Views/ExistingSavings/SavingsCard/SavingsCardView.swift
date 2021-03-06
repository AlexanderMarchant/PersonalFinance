//
//  SavingsCardView.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import SwiftUI

struct SavingsCardView: View {
    
    @Binding var idOfItemToDelete: String?
    @Binding var editingIsEnabled: Bool
    
    @State var showingEditForm = false
    
    @State private var translation: CGSize = .zero
    
    @State private var showingAlert = false
    @State private var buttonOpactity: Double = 0.0
    @State private var buttonScale: Double = 0.1
    
    @ObservedObject var viewModel: ViewModel
    
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
                            primaryButton: .destructive(Text("Yes"), action: deleteAccount),
                            secondaryButton: .cancel({
                                self.resetCardState(animated: true)
                                }
                            )
                        )
                        
                    }
                    .opacity(buttonOpactity)
                    .scaleEffect(CGSize(width: buttonScale, height: buttonScale))
                
                PFActionButton(
                    buttonImage: "edit-icon",
                    backgroundColour: Color.orange,
                    action: {
                        self.showingEditForm.toggle()
                    })
                    .sheet(isPresented: $showingEditForm)
                    {
                        EditSavingsAccountView(
                            viewModel: .init(
                                self.viewModel.getAccount()
                            )
                        )
                    }
                    .opacity(buttonOpactity)
                    .scaleEffect(CGSize(width: buttonScale, height: buttonScale))
                
                PFActionButton(
                    buttonImage: "forward-icon",
                    backgroundColour: Color.blue,
                    action: {
                        self.resetCardState(animated: true)
                    })
                    .opacity(buttonOpactity)
                    .scaleEffect(CGSize(width: buttonScale, height: buttonScale))
            }
            .padding(.trailing, 15)
            
            GeometryReader { geometry in
                HStack {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        PFSubTitleTextView(text: viewModel.balance)
                        
                        Text(viewModel.name)
                            .font(.headline)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text(viewModel.interestType)
                            .font(.headline)
                        PFBodyTextView(text: viewModel.interest)
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
                            if(!self.editingIsEnabled) { return
                            }
                            
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
            .onChange(of: self.editingIsEnabled) { value in
                if(!editingIsEnabled) {
                    self.resetCardState()
                }
            }
        }
    }
    
    func deleteAccount() {
        idOfItemToDelete = viewModel.getAccountId()
        resetCardState(animated: false)
    }
    
    func resetCardState(animated: Bool = true) {
        if(animated) {
            withAnimation(.easeOut) {
                self.resetCardPosition()
            }
        } else {
            resetCardPosition()
        }
    }
    
    private func resetCardPosition() {
        self.translation = .zero
        self.buttonOpactity = 0.0
        self.buttonScale = 0.1
    }
}

struct SavingsCardView_Previews: PreviewProvider {
    static var previews: some View {
        SavingsCardView(
            idOfItemToDelete: Binding<String?>.constant(UUID().uuidString),
            editingIsEnabled: Binding<Bool>.constant(false),
            viewModel: .init(.constant(Account(
                                name: "Testing",
                                balance: 11000.11,
                                interest: 6.34,
                                fixedInterest: false,
                                currency: .GBP))))
    }
}
