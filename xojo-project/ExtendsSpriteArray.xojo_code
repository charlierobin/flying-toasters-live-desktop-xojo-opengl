#tag Module
Protected Module ExtendsSpriteArray
	#tag Method, Flags = &h0
		Sub InsertSorted(extends sprites() as Sprite, s as Sprite)
		  if sprites.Count = 0 then
		    
		    sprites.Add( s )
		    
		    s = nil
		    
		  else
		    
		    for i as Integer = 0 to sprites.LastIndex
		      
		      if s.z <= sprites( i ).z then
		        
		        sprites.AddAt( i, s )
		        
		        s = nil
		        
		        exit
		        
		      end if
		      
		    next
		    
		  end if
		  
		  if s <> nil then sprites.Add( s )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(extends sprites() as Sprite, s as Sprite)
		  sprites.RemoveAt( sprites.IndexOf( s ) )
		  
		  
		End Sub
	#tag EndMethod


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
	#tag EndViewBehavior
End Module
#tag EndModule
