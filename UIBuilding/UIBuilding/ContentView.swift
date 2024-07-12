//
//  ContentView.swift
//  UIBuilding
//
//  Created by iOS Developer on 11/07/24.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    let qrCodeURL = "https://www.nexalink.co"
    
    var body: some View {
        VStack(spacing: 20) {
            // Share my card button
            Button(action: {
                // Action for share my card button
            }) {
                Text("Share my card")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            // QR code image
            if let qrCodeImage = generateQRCode(from: qrCodeURL) {
                Image(uiImage: qrCodeImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
            }

            // Options below the QR code
            VStack(alignment: .leading, spacing: 1) {
                OptionButton(title: "Share my card")
                OptionButton(title: "Add card to wallet")
                OptionButton(title: "Add card to homescreen")
                OptionButton(title: "Create Email signature")
                OptionButton(title: "Create virtual background")
            }
            .padding(.horizontal)

            // Share with AirDrop button
            Button(action: {
                // Action for share with AirDrop button
            }) {
                HStack {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Share with AirDrop")
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .cornerRadius(10)
            }
            .padding(.horizontal)
        }
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage,
           let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgImage)
        }

        return nil
    }
}

struct OptionButton: View {
    let title: String

    var body: some View {
        HStack {
            Image(systemName: "square.and.arrow.up")
            Text(title)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
}

