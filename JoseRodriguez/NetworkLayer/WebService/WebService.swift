//
//  WebService.swift
//  Reto_Tecnico_Jose_QR
//
//  Created by Jose Leoncio Quispe Rodriguez on 4/05/22.
//

import Foundation
import RxSwift
import UIKit

typealias LoadClosure = ()

internal enum WebServiceError: Error {
    case badStatus(Int, Data)
    case api(Int, String)
}

private struct Status: Decodable {
    let code: Int
    let message: String

    enum CodingKeys: String, CodingKey {
        case code = "status_code"
        case message = "status_message"
    }
}
extension Decodable {
    /**
     Validate model and if resultCode is WRC_0003 then session is timeout.
     Use it on every service call.
     */
    func validate(success: (() -> Void) ) {
        /*
        guard let model = self as? ResultCode, model.resultCode == ConstantsPrivate.Services.sessionTimeoutCode else {
            success()
            return
        }
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            ErrorHandler.showAlert(title: "session_timeout_title".localized(), msg: "session_timeout_message".localized(), action: {
                self.dismissAndLogin()
                RemoteLib.shared.setValidateSession(validate: false)
            })
        }else {
            UIAlertController().showInfoAlert(title: "session_timeout_title".localized(), message: "session_timeout_message".localized()) {
                self.dismissAndLogin()
                RemoteLib.shared.setValidateSession(validate: false)
            }
        }
        */
        
    }

}

final internal class WebService {
    private let session = URLSession(configuration: .default)
    private lazy var baseURL: URL = URL(string: PersistentData.shared.baseURL.value)!
    
   // private var timeOutType = LogOutTimerManager.TimeOutType.main
    private let decoder = JSONDecoder()

    init() {
        decoder.dateDecodingStrategy = .deferredToDate
    }

    func load<T>(modelType type: T.Type, from endpoint: Endpoint, showLoader:LoadClosure? = nil, hideLoader:LoadClosure? = nil, base:URL? = nil) -> Observable<T> where T: Decodable {
        print("VISTA1: ")
        var baseUrl: URL
        var request: URLRequest
        if let base = base {
            print("VISTA2:")
            baseUrl = base
            request = endpoint.requestFirebase(with: baseUrl)
            print("request==> \(request)")
        } else {
            print("VISTA3: \(endpoint) ")
           
            baseUrl = baseURL
            request = endpoint.request(with: baseUrl)
            print("FINAL : \(request) ")
        }
      
        let decoder = self.decoder
        
        let vc = UIApplication.topViewController()
        print("VISTA4:")
        let timerValue = false
        if timerValue {
            print("VISTA5:")
            return Observable<T>.empty()
        } else {
            print("VISTA6:")
            if showLoader == nil {
                vc?.hideLoader()
            } else { showLoader }
            print("VISTA7: \(request) ")
          
            return session.rx.data(request: request)
                .map {
                    print("VISTA8:")
                    if hideLoader == nil {
                        vc?.hideLoader()
                    } else { hideLoader }
                    
                    //let json = try JSONSerialization.jsonObject(with: $0, options: []) as? [String : Any]
                    let result = try decoder.decode(T.self, from: $0)
                    print("result=> \(result) \n\n EntityResponse:  \(T.self) -->: \($0) ---")
                    return result
                }
                .catchError { error in
                    
                    if hideLoader == nil {
                        vc?.hideLoader()
                    } else { hideLoader }
                    
                    guard let webServiceError = error as? WebServiceError else {
                        throw error
                    }

                    guard case let .badStatus(_, data) = webServiceError else {
                        throw error
                    }

                    guard let status = try? decoder.decode(Status.self, from: data) else {
                        throw error
                    }

                    throw WebServiceError.api(status.code, status.message)
                }
            }
        }

    //    func setTimeOutType(type: LogOutTimerManager.TimeOutType) {
    //        timeOutType = type
    //    }
    

    
    }



private extension Reactive where Base: URLSession {
    func data(request: URLRequest) -> Observable<Data> {
        return Observable.create { observer in
            let task = self.base.dataTask(with: request) { data, response, error in
                if let error = error {
                    observer.onError(error)
                } else {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        fatalError("Unsupported protocol")
                    }

                    if 200..<300 ~= httpResponse.statusCode {
                        if let data = data {
                            observer.onNext(data)
                        }
                        observer.onCompleted()
                    } else {
                        observer.onError(WebServiceError.badStatus(httpResponse.statusCode, data ?? Data()))
                    }
                }
            }

            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
