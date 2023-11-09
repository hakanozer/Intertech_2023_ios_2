//
//  ProductDetailViewController.swift
//  Project
//
//  Created by HAKAN ÖZER on 9.11.2023.
//

import UIKit
import ImageSlideshow
import WebKit

class ProductDetailViewController: UIViewController, ImageSlideshowDelegate {
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtDetail: UITextView!
    @IBOutlet weak var slideshow: ImageSlideshow!
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func fncBack(_ sender: UIButton) {
        //self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    var item: Product! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ( item != nil ) {
           
            var imageArr: [SDWebImageSource] = []
            for imgPath in item.images {
                imageArr.append( SDWebImageSource(urlString: imgPath)! )
            }
            
            slideshow.slideshowInterval = 5.0
            let pageIndicator = UIPageControl()
            pageIndicator.currentPageIndicatorTintColor = UIColor.red
            slideshow.pageIndicator = pageIndicator
            slideshow.contentScaleMode = .scaleAspectFill
            slideshow.delegate = self
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
            slideshow.addGestureRecognizer(recognizer)
            slideshow.setImageInputs(imageArr)
            
            txtTitle.text = item.title
            let detail = "Yarın 12:00'de Bereketzade no:12, 34421 Beyoğlu/İstanbul Galata Kulesinde görüşelim. Eğer gelemezsen ali@mail.com adresine mail gönder yada 05436667788 nolu telefonu ara. https://google.com.tr. \(item.description)"
            txtDetail.text = detail
            
            let html = "<!DOCTYPE html> <html lang=\"en\"> <head> <meta charset=\"utf-8\" /> <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\" crossorigin=\"anonymous\"> <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL\" crossorigin=\"anonymous\"></script> </head> <body> <div class=\"container\"> <h1> \(detail)</h1> <iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/3ryID_SwU5E?si=MkadTNZib7n_449O\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe></div> </body> </html>"
            
            //webView.loadHTMLString(html, baseURL: nil)
            
        }
        
    }
    
    @objc func didTap() {
        let fullView = slideshow.presentFullScreenController(from: self)
        fullView.slideshow.activityIndicator = DefaultActivityIndicator(style: .large, color: .white)
    }
    

}
