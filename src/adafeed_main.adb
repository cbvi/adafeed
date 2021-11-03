with Sax.Readers;
with Input_Sources.File;
with Adafeed;

procedure Adafeed_Main is
	package FI renames Input_Sources.File;
	package AF renames Adafeed;

	My_Reader	: AF.Reader;
	Input		: FI.File_Input;
begin
	FI.Open ("feed.xml", Input);

	AF.Parse (My_Reader, Input);

	FI.Close (Input);
end Adafeed_Main;
