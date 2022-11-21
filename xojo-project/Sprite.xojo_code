#tag Class
Protected Class Sprite
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function getNew() As Sprite
		  var r as Integer = System.Random.InRange( 0, 7 )
		  
		  if r = 0 then
		    
		    return new SpriteCoaster()
		    
		  elseif r = 1 then
		    
		    return new SpritePolice()
		    
		  elseif r = 2 then
		    
		    return new SpriteToast()
		    
		  elseif r = 3 then
		    
		    return new SpriteBurnedToast()
		    
		  else
		    
		    return new SpriteFlapper()
		    
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update(factor as Single)
		  me.x = me.x - ( Config.kBaseSpeedX * factor * me.speed )
		  
		  me.y = me.y - ( Config.kBaseSpeedY * factor * me.speed )
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		colour As Single
	#tag EndProperty

	#tag Property, Flags = &h0
		index As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		size As Single
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected speed As Single
	#tag EndProperty

	#tag Property, Flags = &h0
		x As Single
	#tag EndProperty

	#tag Property, Flags = &h0
		y As Single
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.z_stored
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.z_stored = value
			  
			  if me.z > Config.kMaxColourThreshold then
			    
			    me.colour = Config.kMaxColour
			    
			  else
			    
			    me.colour = ( ( Config.kMaxColour - Config.kMinColour ) * me.z ) + Config.kMinColour
			    
			  end if
			  
			  var baseOffset as Integer = Config.kSize / 2
			  var minOffset as Integer = Config.kMinSize / 2
			  
			  me.size = ( ( baseOffset - minOffset ) * me.z ) + minOffset
			  
			  me.speed = ( ( Config.kMaxSpeedFactor - Config.kMinSpeedFactor ) * me.z ) + Config.kMinSpeedFactor
			  
			  
			End Set
		#tag EndSetter
		z As Single
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private z_stored As Single
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="x"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="y"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="colour"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="z"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="size"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Single"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
