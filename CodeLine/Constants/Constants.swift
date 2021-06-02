//
//  Constants.swift
//  Belo
//
//  Created by ispha on 10/6/19.
//  Copyright © 2019 ispha. All rights reserved.
//

import Foundation

struct Constants {
    static let FONT_SIZE_CONSTANT_iPad = 5
    static let API_VERSION = 1
    static let LOCATION_RADUIS = 500
    static let LOCATION_LIMIT = 1
    static let ServerKey = "AAAAHJSx6SQ:APA91bEq4Kj077W0TCiyOOPhShHQGtzscOo2EpLEEt3yMSpBH1lo73hYavpx9knVHmWZ-oSzhKZqPA9hyLAoEQ3sRn0MyAc1-l_hBZz548YMEVcOeuV_BnS6rchJDUm2YBrhv_hcpfPU"
    static let FirebaseURL = "https://fcm.googleapis.com/fcm/send"
    
    struct StoryBoardIDs {
        static let Main = "Main"
        static let Tables = "Tables"
        static let Account = "Account"
        static let Tab = "Tab"
        static let Home = "Home"
        static let Branches = "Branches"
        static let Notifications = "Notificaitons"
        static let Profiles = "Profile"
        static let Receipt = "Receipt"
        static let Cart = "Cart"
    }
    
    static let contactUsURL = "http://beloapp.com/"
    static let downloadsFolder = "Attatchments"
    
    struct StoryBoardVCIDs {
        static let PageViewController = "PageViewController"
        static let SignInVc = "SignInViewController"
        static let StartVC = "StartViewController"
        static let TablesViewController = "TablesViewController"
        static let tabHome = "tabHome"
        static let MenuVC = "MenuViewController"
        static let homeNav = "homeNav"
        static let QRCodeViewController = "QRCodeViewController"
        static let GoogleVC = "GoogleVC"
        static let BranchesViewController = "BranchesViewController"
        static let PhoneViewController = "PhoneViewController"
        static let CodeViewController = "CodeViewController"
        static let VisitRatingViewController = "VisitRatingViewController"
        static let BrandEndpageViewController = "BrandEndpageViewController"
        static let BranchesModalViewController = "BranchesModalViewController"
        static let RewardsViewController = "RewardsViewController"
        static let VisitFeedbackViewController = "VisitFeedbackViewController"
        static let CategorySubViewController = "CategorySubViewController"
        static let PresentableViewController = "PresentableViewController"
        static let ItemEndpageViewController = "ItemEndpageViewController"
        static let ReceiteViewController = "ReceiteViewController"
        static let ReceiteViewController2 = "ReceiteViewController2"
    }
    
    struct Colors {
        static let greenColor = "#6C2B7D"
        static let tinColor = "#259653"
        static let blueColor = "2D9CDB"
        static let orangeColor = "F2994A"
        static let voteOptionColor = "E0E0E0"
        static let CommentColor = "#E4E4E4"
        static let imgColor = "#F0F2F5"
        static let popColor = "#24262D"
    }
    
    struct AppSettings {
        func apiKey() -> String {
            return ""/// ServerAPIServant.serverMode == .local ? "ll5qZ1QJjXyZS4Ig" : "gGm6o9vZnHG3wEnK"
        }
        
        func googleKey() -> String {
            return "AIzaSyAK7UaUVfq4jlHS9sV3q1bs1ss2dHOts4g"
        }
    }
    
    struct FontFamilies {
        static let  Montserrat = "DMSans"
        static let  ArabicUIDisplay = "ArabicUIDisplay"
    }
}

public enum WebServicesFlagSenders: String {
    case token = "token"
    case verifyPhone = "auth/sendnumber"
    case verifyCode = "auth/verifynumber"
    case login = "auth/admin/login"
    case register =  "auth/admin/signup"
    case brands = "brand"
    case branches = "branch/nearby"
    case brandsNearBy = "branch/nearbybrands"
    case brandsTrending = "branch/trending"
    case updatePassword = "customer/_id_/updatePassword"
    case updateAfterLaunch = "customer-after-login"
    case updateProfile = "customer/_id_"
    case logout = "auth/logout"
    case customerProfile = "auth/customer-profile"
    case brandInfo = "brand/_id_/brandinfo"
    case brand_rewards = "brand/_id_/rewards"
    case reward_customer = "loyalty-card?customerNumber=_customer_num_&brandId=_brand_id_"
    case customer_feedback = "customer-feedback"
    case brand_categories = "products"
    case Receipt = "receipt"
    case Receipt_By_ID = "receipt/_id_"
    case NotificaionAPi = "notification/customer?limit=_limit_&customerId=_customerId_&offset=_offset_"
    case markSeen = "notification/read"
    case getSetSettings = "customer-settings"
    case car = "car"
    case country = "country"
    case city = "city?country_id=_id_"
    case address = "customer-address"
    case getCoordinatesInfo = "city/near-by?latitude=_latitude_&longitude=_longitude_&radius=_radius_&limit=_limit_"
}

public enum NotificationType: String {
    case EndVisit = "end_visit"
    case LoyaltyClaim = "added_points"
    case Receipt = "receipt"
}
