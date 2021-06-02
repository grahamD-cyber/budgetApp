//
//  SwiftUIView.swift
//  testIntegration
//
//  Created by Graham Desmond on 11/9/20.
//

import UIKit
import SwiftUI


struct ContentView: View
{

    var values: [CGFloat]
    var array: [String]
    @State var isNavigationBarHidden: Bool = true

        var body: some View
        {
            
            ZStack
            {
                
                Color(#colorLiteral(red: 0, green: 0.7961953282, blue: 0.600107193, alpha: 1)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            


                    VStack (spacing: 20)
                    {
                        ForEach(Array(zip(array, values)), id: \.0) { item in
                            barView(width: item.1, name: item.0)
                                
                        }
  
                }
                .animation(.easeOut(duration: 0.5)).transition(.move(edge: .leading))

                .padding(.top, 60)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .animation(.easeOut(duration: 0.8)).transition(.move(edge: .leading))
        }
   

    }



struct barView: View
{
    var width: CGFloat = 0.0
    var name: String
    
    var body: some View
    {
        
        VStack
        {
            ZStack (alignment: .leading)
            {
                
                Capsule().frame(width: 300, height: 40)
                .foregroundColor(Color(#colorLiteral(red: 0.1064112836, green: 0.6299550748, blue: 0.4802876764, alpha: 1)))
                
                if width >= 300
                {

                    Capsule().frame(width: 300, height: 40)
                        .foregroundColor(Color(#colorLiteral(red: 0.9994843602, green: 0.3529348969, blue: 0.3210184574, alpha: 0.9194402825)))
                }
                else if width < 300 && width >= 0
                {
                    Capsule().frame(width: width, height: 40)
                        .foregroundColor(.white)
                }
                else
                {
                    Capsule().frame(width: 0, height: 40)
                        .foregroundColor(.white)
                }
                    
            }
            
            
            Text(name)
            .padding(.top, 2)
            }
        

        
    }
    
}

    //struct SwiftUIView_Previews: PreviewProvider {
        //static var previews: some View {
            //var array: [CGFloat] = [12.0]
            //var array2 = ["LSKjf"]
            //ContentView(array, array2)
        //}
    //}


