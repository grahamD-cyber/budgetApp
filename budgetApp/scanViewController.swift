//
//  scanViewController.swift
//  budgetApp
//
//  Created by Graham Desmond on 11/10/20.
//

import UIKit
import Vision
import VisionKit
import SwiftUI
import AVFoundation

class scanViewController: UIViewController, VNDocumentCameraViewControllerDelegate, UIGestureRecognizerDelegate{

    var firstLoad = true
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var textField: UILabel!
    @IBOutlet weak var EnterAmountButton: UIButton!
    @IBOutlet weak var scanReceiptButton: UIButton!
    var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    private let textRecognitionWorkQueue = DispatchQueue(label: "MyVisionScannerQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    override func viewDidLoad() {
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        let span = UserDefaults.standard.object(forKey: "budgetSpan") as! String
        print(span)
        
        self.loading.isHidden = true
        //self.loading.removeFromSuperview()
        backButton.isHidden = true
        totalNum = 0
        let name = UserDefaults.standard.object(forKey: "customerName")
        let nameString = name as! String
        let welcomeString = "Welcome " + nameString + "!"
        textField.text = welcomeString
        navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        setupVision()


        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let checkFirstTime = UserDefaults.standard.object(forKey: "customerName") as! String
        if firstLoad == true && checkFirstTime != ""{
            guard let navigationController = self.navigationController else { return }
            var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
            navigationArray.remove(at: 0) // To remove previous UIViewController
            self.navigationController?.viewControllers = navigationArray
            firstLoad = false
        }

        
    }
    

    override var prefersStatusBarHidden: Bool {
        return false
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @IBAction func backButton(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func enterTouched(_ sender: Any) {
    }
    
   /* @IBSegueAction func showChart(_ coder: NSCoder) -> UIViewController? {
        let dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]
        return UIHostingController(coder: coder, rootView: ContentView(values: dollar, array: defineHeader()))
    }*/
    @IBAction func scanPressed(_ sender: Any) {
        self.loading.isHidden = true
        let scannerViewController = VNDocumentCameraViewController()
        scannerViewController.delegate = self
        present(scannerViewController, animated: true)
        
    }

    private func setupVision() {
        textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            var detectedText = ""
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else { return }
                //print("text \(topCandidate.string) has confidence \(topCandidate.confidence)")
    
                detectedText += topCandidate.string
                detectedText += "\n"
            }
            
            DispatchQueue.main.async { [self] in
                //self.OcrText = detectedText
                print(detectedText)
                //self.OcrTextView.text = ""
                //self.OcrTextView.text = self.OcrText
                //self.OcrTextView.flashScrollIndicators()

                self.editText(detectedText)

            }
        }

        textRecognitionRequest.recognitionLevel = .accurate
    }
    
    private func processImage(_ image: UIImage)
    {
        //ScanImageView.image = image
        recognizeText(image)
        self.loading.isHidden = false
        view.addSubview(self.loading)
        self.loading.startAnimating()
        
    }
    
    private func recognizeText(_ image: UIImage)
    {
        guard let cgImage = image.cgImage else {return}
        
        //OcrText = ""
        //self.OcrTextView.text = ""
        textRecognitionWorkQueue.async {
            let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try requestHandler.perform([self.textRecognitionRequest])
            } catch {
                print(error)
            }
        }
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            return
        }
        
        let originalImage = scan.imageOfPage(at: 0)
        let newImage = compressedImage(originalImage)
        controller.dismiss(animated: true)
        
        processImage(newImage)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        print(error)
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
    
    func compressedImage(_ originalImage: UIImage) -> UIImage {
        guard let imageData = originalImage.jpegData(compressionQuality: 1),
            let reloadedImage = UIImage(data: imageData) else {
                return originalImage
        }
        return reloadedImage
    }
    
    func editText (_ text: String)
    {
        var max = 0.00
        //var numberArray = [] as [Double]
        let finalText = text.replacingOccurrences(of: "$", with: "", options: NSString.CompareOptions.literal, range: nil)
        let words = finalText.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        for i in 0..<words.count
        {
            let num = Double(words[i])
            if num != nil && words[i].contains(".")
            {
                if Double(num!) > max
                {
                    max = Double(num!)
                }
            }
        }

        totalNum = max
        view.willRemoveSubview(self.loading)
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "checkScan") as! checkScan
        self.navigationController!.pushViewController(vc, animated: true)
        self.loading.isHidden = true
    
    }

}
