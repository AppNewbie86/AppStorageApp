//
//  LoginView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authService : AuthService
    // State Variablen weil wir ihren Wert verfolgen wollen
   // @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var passwort = ""
    @State var visible = false
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            GeometryReader { _ in
                
                VStack {
                    
                    Image("mountain")
                        .resizable()
                        .frame(width :200, height :200)
                    
                    Text("Log in to your account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        
                    
                    TextField("Email", text: $email)
                        .padding()
                      //  .background(RoundedRectangle(cornerRadius: 4)
                      //  .padding(25)
                    
                    HStack(spacing: 10) {
                        
                        VStack {
                            
                            if self.visible{
                                TextField("Passwort", text: $passwort)
                            }
                            else{
                                SecureField("Passwort", text: $passwort)
                            }
                        }
                        Button(action: {
                            self.visible.toggle()
                        }) {
                            Image(systemName: visible ? "eye.slash.fill" : "eye.fill" )
                               // .foregroundColor(self.color)
                        }
                    }
                    .padding()
                   // .background(RoundedRectangle(cornerRadius: 4).stroke(self.passwort != "" ? Color("Color") : self.color,lineWidth: 2))
                    .padding(25)
                    
                    HStack {
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Forget password")
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .padding(25)
                        }
                    }
                    .padding()
                    
                    Button(action: {
                        authService.signIn(email: email, password: passwort)
                    }) {
                        Text("Login")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color.orange)
                    .cornerRadius(10)
                }
            }
        }
    }
}

