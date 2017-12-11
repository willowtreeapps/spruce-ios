
//
//  SortFunctionTestViewController.swift
//  Spruce
//
//  Copyright (c) 2017 WillowTree, Inc.

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import UIKit
import Spruce

enum SortFunctions {
    case base
    case linear
    case cornered
    case radial
    case inline
    case weightedContinuous
    case random
    
    var description: String {
        switch self {
        case .base:
            return "Default"
        case .linear:
            return "Linear"
        case .cornered:
            return "Cornered"
        case .radial:
            return "Radial"
        case .inline:
            return "Inline"
        case .weightedContinuous:
            return "Weighted Continuous"
        case .random:
            return "Random"
        }
    }
}

class SortFunctionTestViewController: UIViewController {

    // Control containers
    @IBOutlet var controlViews: [UIView]!

    @IBOutlet weak var functionControlView: UIView!
    @IBOutlet weak var durationControlView: UIView!
    @IBOutlet weak var delayControlView: UIView!
    @IBOutlet weak var positionControlView: UIView!
    @IBOutlet weak var cornerControlView: UIView!
    @IBOutlet weak var reverseControlView: UIView!
    @IBOutlet weak var directionControlView: UIView!
    @IBOutlet weak var verticalWeightControlView: UIView!
    @IBOutlet weak var horizontalWeightControlView: UIView!
    @IBOutlet weak var timingFunctionControlView: UIView!

    // Controls
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var delaySlider: UISlider!
    @IBOutlet weak var positionPicker: UISegmentedControl!
    @IBOutlet weak var directionPicker: UISegmentedControl!
    @IBOutlet weak var cornerPicker: UISegmentedControl!
    @IBOutlet weak var verticalWeightPicker: UISegmentedControl!
    @IBOutlet weak var horizontalWeightPicker: UISegmentedControl!
    @IBOutlet weak var reverseSwitch: UISwitch!
    @IBOutlet weak var functionTextField: UITextField!
    @IBOutlet weak var codeTextView: UITextView!
    var pickerView: UIPickerView?

    // Preview
    @IBOutlet weak var sortView: UIView!

    // Settings
    let availableFunctions: [SortFunctions] = [.base, .linear, .cornered, .radial, .inline, .weightedContinuous, .random]
    var settings = SortFunctionTestSettings()
    var animationController: CustomAnimationViewController?

    // Lifecycle
    override func viewDidLoad() {
        pickerView = UIPickerView()
        pickerView?.dataSource = self
        pickerView?.delegate = self
        pickerView?.backgroundColor = UIColor.white
        functionTextField.inputView = pickerView
        let reloadGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(reloadSortView))
        sortView.addGestureRecognizer(reloadGestureRecognizer)
        
        addToolbarToSortFunctionField()
        
        delaySlider.setValue(Float(settings.delay), animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        reloadSortView()
    }
    
    func addToolbarToSortFunctionField() {
        let toolbar = UIToolbar()
        toolbar.frame.size.height = 44.0
        toolbar.barStyle = .black
        toolbar.barTintColor = UIColor.white
        toolbar.tintColor = UIColor.spruceGreen
        
        let doneItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(sortFunctionSelected))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPicker))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [cancelButton, flexibleSpace, doneItem]
        functionTextField.inputAccessoryView = toolbar
    }

    func reloadSortView() {
        
        animationController?.view.removeFromSuperview()
        animationController?.removeFromParentViewController()
        
        let testController = self.animationControllerForCurrentSettings()
        self.addChildViewController(testController)
        self.sortView.addSubview(testController.view)
        testController.view.frame = sortView.bounds
        testController.setup()
        animationController = testController

        reloadControlViews()
        let codeForFunction = ExampleCodeGenerator.generateCode(forSettings: settings)
        print("\n\(codeForFunction)\n")
        codeTextView.text = codeForFunction
    }
    
    func reloadControlViews() {
        let activeControlViews = controlViewsForCurrentSettings()
        for view in controlViews {
            view.isHidden = !activeControlViews.contains(view)
        }
    }

    func sortFunctionForCurrentSettings() -> SortFunction {
        var sortFunction: SortFunction
        switch settings.function {
        case .base:
            sortFunction = DefaultSortFunction()
        case .linear:
            sortFunction = LinearSortFunction(direction: settings.direction)
        case .cornered:
            sortFunction = CorneredSortFunction(corner: settings.corner)
        case .radial:
            sortFunction = RadialSortFunction(position: settings.position)
        case .inline:
            sortFunction = InlineSortFunction(corner: settings.corner)
        case .weightedContinuous:
            sortFunction = WeightedSortFunction(position: settings.position, horizontalWeight: settings.horizontalWeight, verticalWeight: settings.verticalWeight)
        case .random:
            sortFunction = RandomSortFunction()
        }

        if var sortFunction = sortFunction as? DistanceSortFunction {
            sortFunction.reversed = settings.reverse
            return sortFunction
        }
        return sortFunction
    }

    func controlViewsForCurrentSettings() -> [UIView] {
        
        var timeView: UIView
        
        switch settings.timingFunction {
        case .total:
            timeView = durationControlView
        case .interItemTime:
            timeView = delayControlView
        default:
            return []
        }
        
        switch settings.function {
        case .base:
            return [functionControlView, timingFunctionControlView, timeView]
        case .linear:
            return [functionControlView, timingFunctionControlView, timeView, directionControlView, reverseControlView]
        case .cornered:
            return [functionControlView, timingFunctionControlView, timeView, cornerControlView, reverseControlView]
        case .radial:
            return [functionControlView, timingFunctionControlView, timeView, positionControlView, reverseControlView]
        case .inline:
            return [functionControlView, timingFunctionControlView, timeView, cornerControlView, reverseControlView]
        case .weightedContinuous:
            return [functionControlView, timingFunctionControlView, timeView, positionControlView, horizontalWeightControlView, verticalWeightControlView, reverseControlView]
        case .random:
            return [functionControlView, timingFunctionControlView, timeView]
        }
    }

    // Actions
    @IBAction func durationDidChange(_ sender: UISlider) {
        settings.duration = Double(sender.value)
        settings.timingFunction = .total(TimeInterval(sender.value))
        reloadSortView()
    }

    @IBAction func delayDidChange(_ sender: UISlider) {
        settings.delay = Double(sender.value)
        settings.timingFunction = .interItemTime(TimeInterval(sender.value))
        reloadSortView()
    }

    @IBAction func positionDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            settings.position = .topLeft
        case 1:
            settings.position = .topMiddle
        case 2:
            settings.position = .topRight
        case 3:
            settings.position = .right
        case 4:
            settings.position = .middle
        case 5:
            settings.position = .left
        case 6:
            settings.position = .bottomLeft
        case 7:
            settings.position = .bottomMiddle
        case 8:
            settings.position = .bottomRight
        default:
            settings.position = .topLeft
        }
        reloadSortView()
    }

    @IBAction func directionDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            settings.direction = .topToBottom
        case 1:
            settings.direction = .bottomToTop
        case 2:
            settings.direction = .leftToRight
        case 3:
            settings.direction = .rightToLeft
        default:
            settings.direction = .topToBottom
        }
        reloadSortView()
    }
    
    @IBAction func horizontalWeightDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            settings.horizontalWeight = .light
        case 1:
            settings.horizontalWeight = .medium
        case 2:
            settings.horizontalWeight = .heavy
        default:
            settings.horizontalWeight = .light
        }
        reloadSortView()
    }
    
    @IBAction func verticalWeightDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            settings.verticalWeight = .light
        case 1:
            settings.verticalWeight = .medium
        case 2:
            settings.verticalWeight = .heavy
        default:
            settings.verticalWeight = .light
        }
        reloadSortView()
    }

    @IBAction func cornerDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            settings.corner = .topLeft
        case 1:
            settings.corner = .topRight
        case 2:
            settings.corner = .bottomLeft
        case 3:
            settings.corner = .bottomRight
        default:
            settings.corner = .topLeft
        }
        reloadSortView()
    }

    @IBAction func reverseDidChange(_ sender: UISwitch) {
        settings.reverse = sender.isOn
        reloadSortView()
    }
    
    @IBAction func timingFunctionDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            settings.timingFunction = .total(TimeInterval(settings.duration))
        case 1:
            settings.timingFunction = .interItemTime(TimeInterval(settings.delay))
        default:
            return
        }
        
        reloadSortView()
    }
}

extension SortFunctionTestViewController {

    func animationControllerForCurrentSettings() -> CustomAnimationViewController {

        let testController = CustomAnimationViewController(nibName: nil, bundle: nil)
        
        let animations = { [weak self, weak testController] in
            let animation = SpringAnimation(duration: 0.5) { view in
                view.alpha = 1.0
                view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
            guard let sortFunction = self?.sortFunctionForCurrentSettings() else {
                return
            }
            guard let settings = self?.settings else {
                return
            }
            testController?.containerView?.spruce.animate(withSortFunction: sortFunction, duration: settings.timingFunction, animation: animation)
        }
        testController.customAnimation = animations
        return testController
    }

}

extension SortFunctionTestViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return availableFunctions[row].description
    }
}

extension SortFunctionTestViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return availableFunctions.count
    }
    
    func sortFunctionSelected() {
        guard let row = pickerView?.selectedRow(inComponent: 0) else {
            return
        }
        self.functionTextField.endEditing(true)
        self.functionTextField.text = availableFunctions[row].description
        settings.function = availableFunctions[row]
        reloadSortView()
    }
    
    func cancelPicker() {
        self.functionTextField.endEditing(true)
        guard let row = availableFunctions.index(of: settings.function) else {
            return
        }
        pickerView?.selectRow(row, inComponent: 0, animated: true)
    }

}

extension SortFunctionTestViewController: UITextViewDelegate, UITextFieldDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}

struct SortFunctionTestSettings {

    var context: String = "Squares"
    var function: SortFunctions = .base
    var duration: Double = 1.0
    var delay: Double = 0.025
    var position: Position = .topLeft
    var direction: Direction = .topToBottom
    var corner: Corner = .topLeft
    var horizontalWeight: Weight = .light
    var verticalWeight: Weight = .light
    var reverse: Bool = false
    var timingFunction: StockTimingFunction = .total(0.025)
}
