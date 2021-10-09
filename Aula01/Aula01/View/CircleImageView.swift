//
//  CircleImageView.swift
//  Aula01
//
//  Created by IOS SENAC on 11/09/21.
//

import SwiftUI

struct CircleImageView: View {
    
    var image: Image
    
    var body: some View{
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 10))
            .shadow(radius: 5)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("Imagem"))
    }
}
