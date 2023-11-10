//
//  ProfileViewController.swift
//  Project
//
//  Created by HAKAN ÖZER on 8.11.2023.
//

import UIKit
import TextFieldEffects
import UserNotifications
import MapKit

class ProfileViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let center = UNUserNotificationCenter.current()

    @IBOutlet weak var txttitle: HoshiTextField!
    @IBOutlet weak var txtSubTitle: HoshiTextField!
    @IBOutlet weak var txtBody: HoshiTextField!
    @IBAction func fncSend(_ sender: UIButton) {
        
        let title = txttitle.text!
        let subtitle = txtSubTitle.text!
        let body = txtBody.text!
        
        // Content
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = UNNotificationSound.default
        
        // Trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        
        let identifier = "userNotification"
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if error != nil {
                print("Notification Error")
            }else {
                print("Notification Create!")
            }
        }
        
        
    }
    
    let arr: [Dictionary<String, Any>] = [
        ["title": "İşletme-1", "detail": "İşletme-1 Detay", "lat": 40.9888026, "long": 28.8909007 ],
        ["title": "İşletme-2", "detail": "İşletme-2 Detay", "lat": 41.000593, "long": 28.9078952 ]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        parseLocation()
        let lat: CLLocationDegrees = arr[0]["lat"] as! CLLocationDegrees
        let long: CLLocationDegrees = arr[0]["long"] as! CLLocationDegrees
        mapZoom(lat: lat, long: long)
    }
    
    func parseLocation() {
        for item in arr {
            let pin = MKPointAnnotation()
            pin.coordinate.latitude = item["lat"] as! CLLocationDegrees
            pin.coordinate.longitude = item["long"] as! CLLocationDegrees
            pin.title = item["title"] as! String
            pin.subtitle = item["detail"] as! String
            self.mapView.addAnnotation(pin)
        }
    }
    
    func mapZoom( lat: CLLocationDegrees, long: CLLocationDegrees ) {
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let center = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let ragion = MKCoordinateRegion(center: center, span: span)
        self.mapView.setRegion(ragion, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let lat = view.annotation?.coordinate.latitude
        let long = view.annotation?.coordinate.longitude
        mapZoom(lat: lat!, long: long!)
        print(view.annotation?.title, view.annotation?.subtitle)
    }


}
