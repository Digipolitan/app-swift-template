//
//  Session.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 01/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public class Session {

    private static var opened: Session?

    public var userInfo: [String : Any] {
        didSet {
            self.save()
        }
    }

    private enum FileInfo {
        public static let name = "app.session.json"
        public static func url() -> URL? {
            guard let baseURL = try? FileManager.default.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
                return nil
            }
            return baseURL.appendingPathComponent(name)
        }
    }

    private init(userInfo: [String: Any]? = nil) {
        self.userInfo = userInfo ?? [:]
    }

    public subscript(key: String) -> Any? {
        return self.userInfo[key]
    }

    @discardableResult
    public static func start() -> Session {
        self.restore()
        guard Session.opened == nil else {
            fatalError("Session already started, please use the restore method")
        }
        let session = Session()
        Session.opened = session
        return session
    }

    @discardableResult
    public static func restore() -> Session? {
        guard Session.opened == nil else {
            return Session.opened
        }
        guard let url = FileInfo.url(),
            let data = try? Data(contentsOf: url),
            let JSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
            let JSONSession = JSON as? [String: Any] else {
            return nil
        }
        let session = Session(userInfo: JSONSession)
        Session.opened = session
        return session
    }

    @discardableResult
    private func save() -> Bool {
        guard let url = FileInfo.url() else {
            return false
        }
        guard let JSON = try? JSONSerialization.data(withJSONObject: self.userInfo) else {
            return false
        }
        return (try? JSON.write(to: url, options: .atomic)) != nil
    }

    @discardableResult
    public func destroy() -> Bool {
        guard let url = FileInfo.url() else {
            return false
        }
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            return false
        }
        Session.opened = nil
        return true
    }
}
