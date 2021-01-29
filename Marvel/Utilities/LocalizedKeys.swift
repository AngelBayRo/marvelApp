//
//  LocalizedKeys.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation

struct LocalizedKeys {
    struct Login {
        static let welcome = "error_generic".localized
        static let email = "login_email".localized
        static let password = "login_password".localized
        static let forgotten = "login_olvidada".localized
        static let errorTitle = "login_error_title".localized
        static let errorBody = "login_error_body".localized
        static let enter = "login_entrar".localized
        static let new = "login_nuevo".localized
        static let register = "login_registrar".localized
        static let registerErrorLogin = "register_error_login".localized
    }
    
    struct ProductDetail {
        static let chatWithVendor = "product_detail_chat_with_vendor".localized
        static let addToCart = "product_detail_add_to_cart".localized
    }
    
    struct NetworkAlert {
        static let title = "network_error_modal_title".localized
        static let message = "network_error_modal_description".localized
        static let buttonRetry = "network_error_modal_retry_button".localized
    }
}
