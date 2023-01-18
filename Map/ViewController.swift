//
//  ViewController.swift
//  Map
//
//  Created by Eunchan Kim on 2023/01/18.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest //정확도 최고로 설정
        locationManger.requestWhenInUseAuthorization() // 위치 데이터 추적을 위한 사용자 승인 요구
        locationManger.startUpdatingHeading() // 위치 업데이트 시작
        myMap.showsUserLocation = true //위치 보기 값을 true로 설정
    }
    // 위도와 경도로 원하는 위치 표시하기
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span:Double) {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) //위도와 경도값을 매개변수로하여 CLLocation Coordinate2DMake 함수를 호출하고 리턴값을 pLocation으로 받음
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) //범위 값을 매개변수로 하여 MKCoordinateSpanMake 함수를 호출하고, 리턴값을 spanValue로 받습니다
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue) //pLocation과 spanValue 값을 매개변수로 하여 MKCoordinateRegionMake 함수를 호출하고, 리턴 값을 pRegion으로 받음.
        myMap.setRegion(pRegion, animated: true) //pRegion값을 매개변수로 하여 myMap.setRegion 함수를 호출
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     
    }
    @IBAction func sgChangeLoc(_ sender: UISegmentedControl) {
    }
    

}

