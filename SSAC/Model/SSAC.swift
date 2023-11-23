import UIKit

struct SSAC {
    // 온습도
    var temp: Double
    var humidity: Double
    
    // 축 각도
    var axisRotationDegree: Double
    
    // 발판 위치
    var shoesPlateTranslationPosition: Double
    
    // 저장된 신발 -> 앱 내 로컬 저장소에 저장
    var shoesList: [Int] = []
    
    // 문의 상태 (True: 열림 <-> False: 닫힘)
    var doorStatus: Bool
    
    
    
}
