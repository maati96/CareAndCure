//
//  ProfileVC.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/23/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class ProfileVC: UIViewController {
    
    @IBOutlet weak var imgeProfile: UIImageView! {
        didSet {
            imgeProfile.layer.borderWidth = 1
            imgeProfile.layer.borderColor = UIColor.white.cgColor
            imgeProfile.layer.masksToBounds = false
            imgeProfile.layer.cornerRadius = imgeProfile.frame.height / 2
            imgeProfile.clipsToBounds = true
        }
    }
    var login = LoginVC()
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var locationBtn: UIButton!
    
    var locationManager = CLLocationManager()
    lazy var geocoder = CLGeocoder()
    var location = CLLocation()
    var isUpdatingLocation = false
    var lastLocationError: Error?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "تم تسجيل دخولك"
        
        navigationItem.rightBarButtonItem  = UIBarButtonItem(title: "خروج", style: .plain, target: self, action: #selector(handleSignOut))
        locationManager.requestWhenInUseAuthorization()
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == .authorizedAlways) {
        }
        featchData()
    }
    
    @objc func handleSignOut() {
        let login = storyboard?.instantiateViewController(withIdentifier: "loginVC")
        UserDefault.instance.isLoggedIn = false
        present(login!, animated: true, completion: nil)
    }
    
    
    func featchData()  {
        //        Alamofire.request(AuthRouter.profile).debugLog().responseData { response in
        //            switch response.result {
        //            case .success(let data):
        //                do {
        //                    let result = try JSONDecoder().decode(Profile.self, from: data)
        //                    print(result.count, result[0])
        //                } catch {
        //                    print(error.localizedDescription)
        //                }
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
    }
    
    func startLocationManger() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            isUpdatingLocation = true
        }
    }
    
    
    func stopLocationManger() {
        if isUpdatingLocation {
            locationManager.startUpdatingLocation()
            locationManager.delegate = nil
            isUpdatingLocation = false
        }
    }
    
    
    @IBAction func changeProfileImgePressed(_ sender: UIButton) {
        print("profile pressed")
        showImagePickerControllerActionSheet()
    }
    
    
    
    
    func reportLocationServicesDeniedError() {
        let alert = UIAlertController(title: "Oops! location service disabled", message: "Plase go to settings > to enable location services for this app", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
}

// MARK: - Image Picker Controller Handle
extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePickerControllerActionSheet() {
        let photoLibraryAction = UIAlertAction(title: "Choose from library", style: .default) { (action) in
            self.showImagePicker(socureImage: .photoLibrary)
        }
        let photoCamiraAction = UIAlertAction(title: "Choose from camira", style: .default) { (action) in
            self.showImagePicker(socureImage: .camera)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        AlertService.showAlert(style: .actionSheet, title: "Choose Your Image", message: nil, actions: [photoLibraryAction, photoCamiraAction, cancelAction], completion: nil)
    }
    
    func showImagePicker(socureImage: UIImagePickerController.SourceType)  {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let Editedimage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imgeProfile.image = Editedimage
        } else if  let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgeProfile.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func locationBtnPressed(_ sender: UIButton) {
        // Create Location
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        if authorizationStatus == .denied || authorizationStatus == .restricted {
            reportLocationServicesDeniedError()
            return
        }
        if isUpdatingLocation {
            stopLocationManger()
        }  else {
            lastLocationError = nil
            startLocationManger()
        }
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            self.processResponse(withPlacemarks: placemarks, error: error)
        }
        print("your location")
    }
    
}

extension ProfileVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error!! location Manger didfail with error\(error)")
        if (error as NSError).code == CLError.locationUnknown.rawValue {
            return
        }
        
        lastLocationError = error
        stopLocationManger()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last!
        stopLocationManger()
    }
    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        if let error = error {
            print("Unable to Reverse Geocode Location (\(error))")
            locationNameLabel.text = "Unable to Find Address for Location"
            
        } else {
            if let placemarks = placemarks, let placemark = placemarks.first {
                locationNameLabel.text = placemark.compactAddress
            } else {
                locationNameLabel.text = "No Matching Addresses Found"
            }
        }
    }
    
    
    
}

extension CLPlacemark {
    
    var compactAddress: String? {
        if let name = name {
            var result = name
            
            if let street = thoroughfare {
                result += ", \(street)"
            }
            
            if let city = locality {
                result += ", \(city)"
            }
            
            if let country = country {
                result += ", \(country)"
            }
            
            return result
        }
        
        return nil
    }
    
}
