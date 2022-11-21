#tag Window
Begin Window WindowMain
   Backdrop        =   0
   BackgroundColor =   &c00000000
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   False
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   648
   ImplicitInstance=   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   926611455
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   False
   Title           =   "Flying Toasters Live Desktop"
   Type            =   4
   Visible         =   True
   Width           =   926
   Begin Timer TimerUpdate
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   35
      RunMode         =   2
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin Timer TimerUpdateFPS
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   500
      RunMode         =   2
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin OpenGLSurface Surface
      AllowAutoDeactivate=   True
      ColorBits       =   24
      ContextHandle   =   0
      DepthBits       =   24
      DoubleBuffer    =   True
      Enabled         =   True
      Height          =   648
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Visible         =   True
      Width           =   926
      Begin Label LabelDebug
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Surface"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Untitled"
         TextAlignment   =   0
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   42
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   389
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  self.setLevel( NSDesktopWindowLevel )
		  
		  self.Width = self.Width + 1
		  
		  self.Width = self.Width - 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  // System.DebugLog( "resized" )
		  
		  self.resize()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  // System.DebugLog( "resizing" )
		  
		  self.resize()
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(screen as Integer)
		  self.screen = screen
		  
		  super.Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub initialise()
		  self.inited = true
		  
		  var path as String = SpecialFolder.Resources.NativePath + "/toaster_*.png"
		  
		  for i as Integer = 0 to 130
		    
		    var s as String = path.ReplaceAll( "*", i.ToString( Locale.Current, "0000" ) )
		    
		    self.loadTextureFromPNGFile( s )
		    
		  next
		  
		  path = SpecialFolder.Resources.NativePath + "/police_*.png"
		  
		  for i as Integer = 0 to 29
		    
		    var s as String = path.ReplaceAll( "*", i.ToString( Locale.Current, "0000" ) )
		    
		    self.loadTextureFromPNGFile( s )
		    
		  next
		  
		  self.loadTextureFromPNGFile( SpecialFolder.Resources.NativePath + "/toast.png" )
		  
		  self.loadTextureFromPNGFile( SpecialFolder.Resources.NativePath + "/toast-burnt.png" )
		  
		  path = SpecialFolder.Resources.NativePath + "/smoke_*.png"
		  
		  for i as Integer = 0 to 31
		    
		    var s as String = path.ReplaceAll( "*", i.ToString( Locale.Current, "0000" ) )
		    
		    self.loadTextureFromPNGFile( s )
		    
		  next
		  
		  // self.loadTextureFromFile
		  // self.loadTextureFromPNGFile
		  
		  // OpenGL.glMatrixMode( OpenGL.GL_PROJECTION )
		  // OpenGL.glLoadIdentity()
		  // OpenGL.glOrtho( 0, self.Width, 0, self.Height, -100, 100 )
		  // OpenGL.glMatrixMode( OpenGL.GL_MODELVIEW )
		  // OpenGL.glLoadIdentity()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub loadTextureFromFile(path as String)
		  var texture_id as MemoryBlock = new MemoryBlock( 4 )
		  
		  OpenGL.glGenTextures( 1, texture_id )
		  
		  var openGLTextureID as Integer = texture_id.Long( 0 )
		  
		  OpenGL.glBindTexture( OpenGL.GL_TEXTURE_2D, openGLTextureID )
		  
		  
		  
		  
		  var f as FolderItem = new FolderItem( path, FolderItem.PathModes.Native )
		  
		  
		  var imageData As MemoryBlock = new MemoryBlock( 1024 * 1024 * 4 )
		  
		  
		  
		  var readStream as BinaryStream = BinaryStream.Open( new FolderItem( "/Users/charlie/Desktop/testing/" + f.Name + ".test", FolderItem.PathModes.Native ) ) 
		  
		  readStream.LittleEndian = true 
		  
		  imageData = readStream.Read( ( 1024 * 1024 * 4 ) - 1 )
		  
		  readStream.Close()
		  
		  
		  
		  
		  
		  OpenGL.glTexImage2D( OpenGL.GL_TEXTURE_2D, 0, OpenGL.GL_RGBA, 1024, 1024, 0, OpenGL.GL_RGBA, OpenGL.GL_UNSIGNED_BYTE, imageData )
		  
		  OpenGL.glTexParameteri( OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_MIN_FILTER, OpenGL.GL_LINEAR )
		  OpenGL.glTexParameteri( OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_MAG_FILTER, OpenGL.GL_LINEAR )
		  
		  OpenGL.glTexParameteri( OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_S, OpenGL.GL_CLAMP )
		  OpenGL.glTexParameteri( OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_T, OpenGL.GL_CLAMP )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub loadTextureFromPNGFile(path as String)
		  #pragma BackgroundTasks false
		  #pragma BoundsChecking false
		  #pragma NilObjectChecking false
		  #pragma StackOverflowChecking false
		  
		  var f as FolderItem = new FolderItem( path, FolderItem.PathModes.Native )
		  
		  var theImage as Picture = Picture.Open( f )
		  
		  var surfaceRGB as RGBSurface = theImage.RGBSurface
		  
		  
		  var texture_id as MemoryBlock = new MemoryBlock( 4 )
		  
		  OpenGL.glGenTextures( 1, texture_id )
		  
		  var openGLTextureID as Integer = texture_id.Long( 0 )
		  
		  OpenGL.glBindTexture( OpenGL.GL_TEXTURE_2D, openGLTextureID )
		  
		  
		  var ImageData As MemoryBlock = new MemoryBlock( theImage.Width * theImage.Height * 4 )
		  
		  
		  var xPos, yPos, count as Integer
		  
		  var pixel as Color
		  
		  count = 0
		  
		  for yPos = 0 to theImage.Height - 1
		    
		    for xPos = 0 to theImage.Width - 1
		      
		      pixel = surfaceRGB.Pixel( xPos, yPos )
		      
		      ImageData.Byte( count ) = pixel.Red
		      ImageData.Byte( count + 1 ) = pixel.Green
		      ImageData.Byte( count + 2 ) = pixel.Blue
		      ImageData.Byte( count + 3 ) = 255 - pixel.Alpha
		      
		      // TODO check opengl blend function with above
		      
		      count = count + 4
		      
		    next
		    
		  next
		  
		  
		  // var writeStream as BinaryStream = BinaryStream.Create( new FolderItem( "/Users/charlie/Desktop/testing/" + f.Name + ".test", FolderItem.PathModes.Native ), true ) 
		  // writeStream.LittleEndian = true 
		  // writeStream.Write( ImageData )
		  // writeStream.Close()
		  
		  
		  OpenGL.glTexImage2D( OpenGL.GL_TEXTURE_2D, 0, OpenGL.GL_RGBA, theImage.Width, theImage.Height, 0, OpenGL.GL_RGBA, OpenGL.GL_UNSIGNED_BYTE, ImageData )
		  
		  OpenGL.glTexParameteri( OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_MIN_FILTER, OpenGL.GL_LINEAR )
		  OpenGL.glTexParameteri( OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_MAG_FILTER, OpenGL.GL_LINEAR )
		  
		  OpenGL.glTexParameteri( OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_S, OpenGL.GL_CLAMP )
		  OpenGL.glTexParameteri( OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_T, OpenGL.GL_CLAMP )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub resize()
		  // OpenGL.glViewport( 0, 0, self.Width, self.Height )
		  
		  // OpenGL.glMatrixMode( OpenGL.GL_PROJECTION )
		  
		  // OpenGL.glLoadIdentity()
		  
		  // OpenGL.glOrtho( 0, self.Width, 0, self.Height, -10, 10 )
		  
		  // OpenGL.glMatrixMode( OpenGL.GL_MODELVIEW )
		  
		  // OpenGL.glLoadIdentity()
		  
		  
		  
		  
		  OpenGL.glMatrixMode( OpenGL.GL_PROJECTION )
		  OpenGL.glLoadIdentity()
		  OpenGL.glOrtho( 0, self.Width, 0, self.Height, -100, 100 )
		  OpenGL.glMatrixMode( OpenGL.GL_MODELVIEW )
		  OpenGL.glLoadIdentity()
		  
		  
		  self.factor = self.Width / 1000
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private counter As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private factor As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private fps As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private inited As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		screen As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private sprites() As Sprite
	#tag EndProperty


#tag EndWindowCode

#tag Events TimerUpdate
	#tag Event
		Sub Action()
		  #pragma BackgroundTasks false
		  #pragma BoundsChecking false
		  #pragma NilObjectChecking false
		  #pragma StackOverflowChecking false
		  
		  var toDelete() as Sprite
		  
		  for each sprite as Sprite in self.sprites
		    
		    sprite.update( self.factor )
		    
		    if sprite.x <= - ( Config.kSize * self.factor ) / 2 then
		      
		      toDelete.Add( sprite )
		      
		    else
		      
		      if sprite.y <= - ( Config.kSize * self.factor ) / 2 then toDelete.Add( sprite )
		      
		    end if
		    
		  next
		  
		  for each sprite as Sprite in toDelete
		    
		    self.sprites.Remove( sprite )
		    
		  next
		  
		  self.counter = self.counter + 1
		  
		  self.Surface.Invalidate()
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimerUpdateFPS
	#tag Event
		Sub Action()
		  self.fps = self.counter / ( me.Period / 1000 )
		  
		  // self.LabelDebug.Text = self.fps.ToString() + " for " + self.sprites.Count.ToString()
		  
		  self.counter = 0
		  
		  if System.Random.InRange( 0, 10 ) > 5 then return
		  
		  var s as Sprite = Sprite.getNew()
		  
		  var total as Double = self.Width + self.Height
		  
		  var r as Double = System.Random.InRange( Config.kSize * self.factor, total )
		  
		  if r > self.Width then
		    
		    s.x = self.Width + ( ( Config.kSize * self.factor ) / 2 )
		    
		    s.y = System.Random.InRange( ( Config.kSize * self.factor ) / 2, self.Height - ( ( Config.kSize * self.factor ) / 2 ) )
		    
		  else
		    
		    s.x = System.Random.InRange( ( Config.kSize * self.factor ), self.Width )
		    
		    s.y = self.Height + ( ( Config.kSize * self.factor ) / 2 )
		    
		  end if
		  
		  s.z = System.Random.InRange( 0, 100 ) / 100
		  
		  self.sprites.InsertSorted( s )
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Surface
	#tag Event
		Function Render() As Boolean
		  if not self.inited then self.initialise()
		  
		  
		  OpenGL.glClear( OpenGL.GL_COLOR_BUFFER_BIT )
		  OpenGL.glClear( OpenGL.GL_DEPTH_BUFFER_BIT )
		  
		  OpenGL.glClearColor( 0.0, 0.0, 0.0, 1.0 )
		  
		  
		  OpenGL.glEnable( OpenGL.GL_TEXTURE_2D )
		  OpenGL.glEnable( OpenGL.GL_BLEND )
		  OpenGL.glBlendFunc( OpenGL.GL_SRC_ALPHA, OpenGL.GL_ONE_MINUS_SRC_ALPHA )
		  OpenGL.glDisable( OpenGL.GL_DEPTH_TEST )
		  
		  
		  var size as Single
		  
		  for each sprite as Sprite in self.sprites
		    
		    OpenGL.glBindTexture( OpenGL.GL_TEXTURE_2D, sprite.index + 1 )
		    
		    OpenGL.glColor4f( sprite.colour, sprite.colour, sprite.colour, 1.0 )
		    
		    
		    OpenGL.glPushMatrix()
		    
		    OpenGL.glTranslatef( sprite.x, sprite.y, 0 )
		    
		    size = sprite.size * self.factor
		    
		    OpenGL.glScalef( size, size, size )
		    
		    // TODO prebuilt / cached quad polygon, don't rebuild every time?
		    
		    OpenGL.glBegin( OpenGL.GL_QUADS )
		    
		    OpenGL.glTexCoord2f( 0.0, 0.0 )
		    OpenGL.glVertex3i( -1, 1, 0 )
		    
		    OpenGL.glTexCoord2f( 0.0, 1.0 )
		    OpenGL.glVertex3i( -1, -1, 0 )
		    
		    OpenGL.glTexCoord2f( 1.0, 1.0 )
		    OpenGL.glVertex3i( 1, -1, 0 )
		    
		    OpenGL.glTexCoord2f( 1.0, 0.0 )
		    OpenGL.glVertex3i( 1, 1, 0 )
		    
		    OpenGL.glEnd()
		    
		    OpenGL.glPopMatrix()
		    
		  next
		  
		  
		End Function
	#tag EndEvent
#tag EndEvents
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="screen"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
