#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  for i as Integer = 0 to Screen.ScreenCount - 1
		    
		    var w as WindowMain = new WindowMain( i )
		    
		    var s as Screen = Screen.ScreenAt( i )
		    
		    w.Bounds = new Rect( s.Left, s.Top, s.Width, s.Height )
		    
		    me.windows.Add( w )
		    
		  next
		  
		  
		  // var w as WindowMain = new WindowMain()
		  // 
		  // var s as Screen = Screen.ScreenAt( 0 )
		  // 
		  // w.FullScreen = true
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ShowPreferences() As Boolean Handles ShowPreferences.Action
			if me.prefsWindow <> nil then
			
			me.prefsWindow.Show()
			
			else
			
			me.prefsWindow = new WindowPreferences()
			
			end if
			
			return true
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function existsFor(index as Integer) As WindowMain
		  for each w as WindowMain in App.windows
		    
		    if w.screen = index then
		      
		      return w
		      
		    end if
		    
		  next
		  
		  return nil
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		prefsWindow As WindowPreferences
	#tag EndProperty

	#tag Property, Flags = &h0
		windows() As WindowMain
	#tag EndProperty


	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
