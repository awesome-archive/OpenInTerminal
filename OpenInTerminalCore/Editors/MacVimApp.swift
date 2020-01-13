//
//  MacVim.swift
//  OpenInTerminalCore
//
//  Created by Jianing Wang on 2020/1/8.
//  Copyright © 2020 Jianing Wang. All rights reserved.
//

import Foundation

final class MacVimApp: Editor {
    
    func open(_ path: String) throws {
        
        guard let url = URL(string: path) else {
            throw OITError.wrongUrl
        }
        
        let source = """
        do shell script "open -a MacVim \(url.path.specialCharEscaped)"
        """
        
        let script = NSAppleScript(source: source)!
        
        var error: NSDictionary?
        
        script.executeAndReturnError(&error)
        
        if error != nil {
            throw OITError.cannotAccessApp(EditorType.macVim.rawValue)
        }
    }
    
}
