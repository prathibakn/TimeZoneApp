class RootViewController < UIViewController
  def viewDidLoad
    @defaultTimeZoneLabel = location_label(25, 120)
    @defaultTimeLabel = time_label(50,150)
    
    chooseLocalButton = select_time_zone_button(220,115)
    chooseLocalButton.addTarget(self, action: :'present_local_zone_picker:', forControlEvents:UIControlEventTouchUpInside)
    @zonePicker = zone_picker(0,244)
    @zonePicker.dataSource = self
    @zonePicker.delegate = self

    view.addSubview(@defaultTimeZoneLabel)
    view.addSubview(@defaultTimeLabel)
    view.addSubview(chooseLocalButton)
    view.addSubview(@zonePicker)
    set_default_time_zone
    set_default_time
   
    view.backgroundColor = UIColor.scrollViewTexturedBackgroundColor
  end

  def set_default_time_zone
    @defaultTimeZoneLabel.text = NSTimeZone.localTimeZone.name
  end
  
  def set_default_time
    defaultTimeZone = NSTimeZone.timeZoneWithName(@defaultTimeZoneLabel.text)
    formatter = NSDateFormatter.alloc.init
    formatter.setDateFormat('HH:mm')
    formatter.setTimeZone(defaultTimeZone)
    dateFormat = formatter.stringFromDate(NSDate.date)
    @defaultTimeLabel.text = "UTC " + (NSTimeZone.localTimeZone.secondsFromGMT/3600).to_s +  " " + dateFormat
  end

  def present_local_zone_picker(sender)
    button = sender
    @zonePicker.frame = CGRectMake(0, 244, 320, 216)
    @currentZoneLabel = @defaultTimeZoneLabel
    if @zonePicker.isHidden
      @zonePicker.hidden = false
      button.setTitle("Choose", forState:UIControlStateNormal)
    else
      @zonePicker.hidden = true
      button.setTitle("Select", forState:UIControlStateNormal)
      set_default_time
    end
  end

  def numberOfComponentsInPickerView(pickerView)
    1
  end

  def pickerView(pickerView, numberOfRowsInComponent:component)
    NSTimeZone.knownTimeZoneNames.count
  end


  def pickerView(pickerView, titleForRow:row, forComponent:component)
    NSTimeZone.knownTimeZoneNames[row]
  end

  def pickerView(pickerView, didSelectRow:row, inComponent:component)
    @currentZoneLabel.text = NSTimeZone.knownTimeZoneNames[row]
  end

end
