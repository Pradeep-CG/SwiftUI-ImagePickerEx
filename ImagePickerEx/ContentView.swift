//
//  ContentView.swift
//  ImagePickerEx
//
//  Created by Pradeep on 03/07/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack{
            image?
            .resizable()
            .scaledToFit()
            
            Button("Select image"){
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker,onDismiss: loadImage){
            ImagePicker(image: self.$inputImage)
        }
   // .onAppear(perform: loadImage)
    }
    func loadImage()  {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
