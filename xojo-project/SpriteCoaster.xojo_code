#tag Class
Protected Class SpriteCoaster
Inherits Sprite
	#tag Method, Flags = &h0
		Sub Constructor()
		  me.index = System.Random.InRange( 0, 130 )
		  
		  me.state = States.Flapping
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update(factor as Single)
		  super.update( factor )
		  
		  select case me.state
		    
		  case States.Flapping
		    
		    me.index = me.index + 1
		    
		    if me.index > 63 then
		      
		      if System.Random.InRange( 0, 5 ) > 1 then
		        
		        me.index = 0
		        
		      else
		        
		        me.index = 64
		        
		        me.state = States.StartingToCoast
		        
		      end if
		      
		    end if
		    
		  case States.StartingToCoast
		    
		    me.index = me.index + 1
		    
		    if me.index > 86 then
		      
		      me.state = States.Coasting
		      
		    end if
		    
		  case States.Coasting
		    
		    me.index = me.index + 1
		    
		    if me.index > 110 then
		      
		      if System.Random.InRange( 0, 5 ) > 1 then
		        
		        me.index = 86
		        
		      else
		        
		        me.index = 111
		        
		        me.state = States.FinishingCoast
		        
		      end if
		      
		    end if
		    
		  case States.FinishingCoast
		    
		    me.index = me.index + 1
		    
		    if me.index > 130 then
		      
		      me.index = 0
		      
		      me.state = States.Flapping
		      
		    end if
		    
		  else
		    
		    // nothing
		    
		  end select
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private state As States
	#tag EndProperty


	#tag Enum, Name = States, Type = Integer, Flags = &h21
		Flapping
		  StartingToCoast
		  Coasting
		FinishingCoast
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="colour"
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
		#tag ViewProperty
			Name="z"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Single"
			EditorType=""
		#tag EndViewProperty
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
	#tag EndViewBehavior
End Class
#tag EndClass
