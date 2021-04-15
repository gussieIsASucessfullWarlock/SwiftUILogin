//
//  ContentView.swift
//  Login Code
//
//  Created by Gussie Is A Sucessful Warlock on 4/11/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {

      NavigationView{
          
          Login()
              .navigationBarHidden(true)
              .navigationBarBackButtonHidden(true)
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
      ContentView()
  }
}

struct Login: View {
  @State var email = ""
  @State var password = ""
  @Namespace var animation
  @State var rst = false
  @State var show = false
  
  var body: some View {
      
      VStack{
          
          Spacer(minLength: 0)
          
          HStack{
              
              VStack(alignment: .leading, spacing: 10) {
                  
                  Text("Login")
                      .font(.system(size: 40, weight: .heavy))
                      // for Dark Mode Adoption...
                      .foregroundColor(.primary)
                  
                  Text("Please sign in to continue")
                      .fontWeight(.semibold)
                      .foregroundColor(.gray)
              }
              
              Spacer(minLength: 0)
          }
          .padding()
          .padding(.leading)
          
          CustomTextField(image: "envelope", title: "EMAIL", value: $email,animation: animation)
          
          CustomTextField(image: "lock", title: "PASSWORD", value: $password,animation: animation)
              .padding(.top,5)
          
          HStack{
              
              Spacer(minLength: 0)
              
              VStack(alignment: .trailing, spacing: 20) {
                  
                  Button(action: {
                    rst.toggle()
                    show = false
                  }) {
                      
                      Text("FORGOT")
                          .fontWeight(.heavy)
                        .foregroundColor(Color.orange)
                  }
                  
                  Button(action: {}) {
                      
                      HStack(spacing: 10){
                          
                          Text("LOGIN")
                              .fontWeight(.heavy)
                          
                          Image(systemName: "arrow.right")
                              .font(.title2)
                      }
                      .modifier(CustomButtonModifier())

                  }
              }
          }
          .padding()
          .padding(.top,10)
          .padding(.trailing)
          
          Spacer(minLength: 0)
          
          HStack(spacing: 8){
            Button(action: {
                    show.toggle()
                    rst = false}, label: {
                Text("Don't have an account?")
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
            })
            Spacer()
              NavigationLink(destination: Register(show: $show), isActive: $show) {
                EmptyView()
              }
            NavigationLink(destination: Reset(show: $rst), isActive: $rst) {
                EmptyView()
            }
          }
          .padding()
      }
  }
}

struct Register: View {
  
  @State var email = ""
  @State var password = ""
  @State var name = ""
  @State var number = ""
  
  @Binding var show : Bool
  
  @Namespace var animation
  
  var body: some View {
      
      ScrollView(.vertical, showsIndicators: false, content: {
          
          VStack{
              
              HStack{
                  
                  Button(action: {show.toggle()}) {
                      
                      Image(systemName: "arrow.left")
                          .font(.largeTitle)
                          .foregroundColor(.gray)
                  }
                  
                  Spacer()
              }
              .padding()
              .padding(.leading)
              
              HStack{
                  
                  Text("Create Account")
                      .font(.system(size: 40))
                      .fontWeight(.heavy)
                      .foregroundColor(.primary)
                  
                  Spacer(minLength: 0)
              }
              .padding()
              .padding(.leading)
              
              CustomTextField(image: "person", title: "FULL NAME", value: $name, animation: animation)
              
              CustomTextField(image: "envelope", title: "EMAIL", value: $email, animation: animation)
                  .padding(.top,5)
              
              CustomTextField(image: "lock", title: "PASSWORD", value: $password, animation: animation)
                  .padding(.top,5)
              
              CustomTextField(image: "phone.fill", title: "PHONE NUMBER", value: $number, animation: animation)
                  .padding(.top,5)
              
              HStack{
                  
                  Spacer()
                  
                  Button(action: {}) {
                      
                      HStack(spacing: 10){
                          
                          Text("SIGN UP")
                              .fontWeight(.heavy)
                          
                          Image(systemName: "arrow.right")
                              .font(.title2)
                      }
                      .modifier(CustomButtonModifier())

                  }
              }
              .padding()
              .padding(.top)
              .padding(.trailing)
          }
      })
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
  }
}

struct Reset: View {
  
  @State var email = ""
  
  @Binding var show : Bool
  
  @Namespace var animation
  
  var body: some View {
      
      ScrollView(.vertical, showsIndicators: false, content: {
          
          VStack{
              
              HStack{
                  
                  Button(action: {show.toggle()}) {
                      
                      Image(systemName: "arrow.left")
                          .font(.largeTitle)
                          .foregroundColor(.gray)
                  }
                  
                  Spacer()
              }
              .padding()
              .padding(.leading)
              
              HStack{
                  
                  Text("Password Reset")
                      .font(.system(size: 40))
                      .fontWeight(.heavy)
                      .foregroundColor(.primary)
                  
                  Spacer(minLength: 0)
              }
              .padding()
              .padding(.leading)
              
              CustomTextField(image: "envelope", title: "EMAIL", value: $email, animation: animation)
                  .padding(.top,5)
              
              HStack{
                  
                  Spacer()
                  
                  Button(action: {}) {
                      
                      HStack(spacing: 10){
                          
                          Text("Reset")
                              .fontWeight(.heavy)
                          
                          Image(systemName: "arrow.right")
                              .font(.title2)
                      }
                      .modifier(CustomButtonModifier())

                  }
              }
              .padding()
              .padding(.top)
              .padding(.trailing)
          }
      })
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
  }
}

struct CustomButtonModifier: ViewModifier {

  func body(content: Content) -> some View {
      
      return content
          .foregroundColor(.white)
          .padding(.vertical)
          .padding(.horizontal,35)
        .background(Color.orange)
          .clipShape(Capsule())
  }
}

struct CustomTextField: View {
  
  // Fields...
  var image: String
  var title: String
  @Binding var value: String
  
  var animation: Namespace.ID
  
  var body: some View {
      
      VStack(spacing: 6){
          
          HStack(alignment: .bottom){
              
              Image(systemName: image)
                  .font(.system(size: 22))
                  .foregroundColor(value == "" ? .gray : .primary)
                  .frame(width: 35)
              
              VStack(alignment: .leading, spacing: 6) {
                  
                  if value != ""{
                      
                      Text(title)
                          .font(.caption)
                          .fontWeight(.heavy)
                          .foregroundColor(.gray)
                          .matchedGeometryEffect(id: title, in: animation)
                  }
                  
                  ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                      
                      if value == ""{
                          
                          Text(title)
                              .font(.caption)
                              .fontWeight(.heavy)
                              .foregroundColor(.gray)
                              .matchedGeometryEffect(id: title, in: animation)
                      }
                      
                      if title == "PASSWORD"{
                          
                          SecureField("", text: $value)
                      }
                      else{
                          TextField("", text: $value)
                          // For Phone Number...
                              .keyboardType(title == "PHONE NUMBER" ? .numberPad : .default)
                      }
                  }
              }
          }
          
          if value == ""{
              
              Divider()
          }
      }
      .padding(.horizontal)
      .padding(.vertical,10)
      .background(Color("txt").opacity(value != "" ? 1 : 0))
      .cornerRadius(8)
      .shadow(color: Color("txt-2").opacity(value == "" ? 0 : 0.1), radius: 5, x: 5, y: 5)
      .shadow(color: Color("txt-2").opacity(value == "" ? 0 : 0.05), radius: 5, x: -5, y: -5)
      .padding(.horizontal)
      .padding(.top)
      .animation(.linear)
  }
}
