with Sax.Readers;	use Sax.Readers;
with Unicode.CES;
with Sax.Attributes;
with Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;

package AdaFeed is
	package UC renames Unicode.CES;
	package UB renames Ada.Strings.Unbounded;
	package IO renames Ada.Strings.Unbounded.Text_IO;

	type Reader is new Sax.Readers.Reader with record
		Current_Pref	: UB.Unbounded_String;
		Current_Value	: UB.Unbounded_String;
		Current_Element	: UB.Unbounded_String;
		In_Item		: Boolean := False;
		In_Title	: Boolean := False;
	end record;

	procedure Start_Element
		(Handler	: in out Reader;
		 Namespace_URI	: UC.Byte_Sequence := "";
		 Local_Name	: UC.Byte_Sequence := "";
		 Qname		: UC.Byte_Sequence := "";
		 Atts		: Sax.Attributes.Attributes'Class);

	procedure End_Element
		(Handler	: in out Reader;
		 Namespace_URI	: UC.Byte_Sequence := "";
		 Local_Name	: UC.Byte_Sequence := "";
		 Qname		: UC.Byte_Sequence := "");

	procedure Characters
		(Handler	: in out Reader;
		 Ch		: UC.Byte_Sequence);
end AdaFeed;
