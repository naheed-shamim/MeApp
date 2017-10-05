//
//  KeyboardManager.swift
//  CEConnect
//
//  Created by Shamshad Khan on 08/08/17.
//  Copyright © 2017 Mindfire Solutions. All rights reserved.
//

import UIKit

class KeyboardManager: NSObject {
	
	static var shared = KeyboardManager()
	
	var mScrollView: UIScrollView?
	
	func addNotification(onScrollView scrollView:UIScrollView) {
		
		mScrollView = scrollView
		
		NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		
		NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
	}
	
	func removeNotification() {
		
		mScrollView = nil
		NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
	}
	
	@objc private func hideKeyboard() {
        
		let contentInsets = UIEdgeInsets.zero
		mScrollView?.contentInset = contentInsets
		mScrollView?.scrollIndicatorInsets = contentInsets
	}
	
	@objc private func showKeyboard(notification: NSNotification) {
	
		guard let info = notification.userInfo else {
			return
		}
		
		let kbSize = (info[UIKeyboardFrameBeginUserInfoKey] as! CGRect).size
		
		let contentInsets = UIEdgeInsetsMake(0, 0, kbSize.height, 0)
		
		self.mScrollView?.contentInset = contentInsets
		self.mScrollView?.scrollIndicatorInsets = contentInsets
	}	
}
