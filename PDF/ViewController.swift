//
//  ViewController.swift
//  PDF
//
//  Created by Charles Martin Reed on 9/1/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import PDFKit
import UIKit

@objcMembers //exposes your obj-c primitives to swift code. Compare to typing @objc before each method used by a selector.

class ViewController: UIViewController {

    //MARK:- PDF Properties
    var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create and add pdf view
        pdfView = PDFView()
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)
        
        //make the pdf take up the full screen
        pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //load our example pdf and make it load immediately
        let url = Bundle.main.url(forResource: "employee-handbook", withExtension: "pdf")!
        pdfView.document = PDFDocument(url: url)
        
        //double page spread layout
        //pdfView.displayMode = .twoUpContinuous
        //pdfView.displaysAsBook = true
        
        //MARK:- Navbar buttons
        let printSelectionBtn = UIBarButtonItem(title: "Selection", style: .plain, target: self, action: #selector(printSelection))
        let firstPageBtn = UIBarButtonItem(title: "First", style: .plain, target: self, action: #selector(firstPage))
        let lastPageBtn = UIBarButtonItem(title: "Last", style: .plain, target: self, action: #selector(lastPage))
        
        navigationItem.rightBarButtonItems = [printSelectionBtn, firstPageBtn, lastPageBtn]
    }

    //MARK:- Navbar button functions
    func printSelection() {
        print(pdfView.currentSelection ?? "No selection")
    }
    
    func firstPage() {
        pdfView.goToFirstPage(nil)
    }
    
    func lastPage() {
        pdfView.goToLastPage(nil)
    }


}

