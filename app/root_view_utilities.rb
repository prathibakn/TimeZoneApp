def  location_label(xPosition, yPosition)
  label = UILabel.alloc.initWithFrame(CGRectMake(xPosition, yPosition, 200, 50))
  label.backgroundColor = UIColor.clearColor
  label.font = UIFont.fontWithName("HelveticaNeue-CondensedBold", size:18)
  label.text = "Time Zone"
  label
end

def time_label(xPosition, yPosition)
  label = UILabel.alloc.initWithFrame(CGRectMake(xPosition, yPosition, 200, 50))
  label.backgroundColor = UIColor.clearColor
  label.text = "Time"
  label.textColor = UIColor.whiteColor
  label
end

def select_time_zone_button(xPosition, yPosition)
  button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
  button.frame = CGRectMake(xPosition, yPosition, 90, 90)
  button.setTitle("Select", forState:UIControlStateNormal)
  button
end

def zone_picker(xPosition, yPosition)
  picker = UIPickerView.alloc.initWithFrame(CGRectMake(xPosition, yPosition, 320, 250))
  picker.hidden = true
  picker.showsSelectionIndicator = true
  picker
end
