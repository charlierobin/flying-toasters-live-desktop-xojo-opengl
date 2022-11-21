#tag Module
Protected Module Config
	#tag Constant, Name = kBaseSpeedX, Type = Double, Dynamic = False, Default = \"2.5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kBaseSpeedY, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMaxColour, Type = Double, Dynamic = False, Default = \"1.0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMaxColourThreshold, Type = Double, Dynamic = False, Default = \"0.95", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMaxSpeedFactor, Type = Double, Dynamic = False, Default = \"1.0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMinColour, Type = Double, Dynamic = False, Default = \"0.4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMinSize, Type = Double, Dynamic = False, Default = \"40", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMinSpeedFactor, Type = Double, Dynamic = False, Default = \"0.3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSize, Type = Double, Dynamic = False, Default = \"100", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSpeedMultiplierForFastOnes, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant


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
