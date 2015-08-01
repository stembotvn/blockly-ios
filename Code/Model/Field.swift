/*
* Copyright 2015 Google Inc. All Rights Reserved.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import Foundation

/**
Input field.  Used for editable titles, variables, etc. This is an abstract class that defines the
UI on the block.  Actual instances would be |FieldLabel|, |FieldDropdown|, etc.

- TODO:(vicng) The Obj-C bridging header isn't generated properly when a class marked with @objc
has a subclass (ie. FieldLabel.swift). This looks like a bug with Xcode 7.
When it's fixed, replace "@objc" with "@objc(BKYField)".
*/
@objc
public class Field: NSObject {
  // MARK: - Enum - FieldType

  /** Represents types of fields. */
  @objc
  public enum BKYFieldType: Int {
    case Label = 0, Input, Angle, Checkbox, Colour, Date, Variable, Dropdown, Image

    private static let stringMapping = [
      Label: "field_label",
      Input: "field_input",
      Angle: "field_angle",
      Checkbox: "field_checkbox",
      Colour: "field_colour",
      Date: "field_date",
      Variable: "field_variable",
      Dropdown: "field_dropdown",
      Image: "field_image",
    ]

    public func stringValue() -> String {
      return BKYFieldType.stringMapping[self]!
    }

    internal init?(string: String) {
      if let value = BKYFieldType.stringMapping.bky_anyKeyForValue(string) {
        self = value
      }
      return nil
    }
  }
  public typealias FieldType = BKYFieldType

  // MARK: - Properties

  public let type: FieldType
  public let name: String

  // MARK: - Initializers

  internal init(type: FieldType, name: String) {
    self.type = type
    self.name = name
  }
}