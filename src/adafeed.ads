with Sax.Readers;
with Unicode.CES;
with Sax.Attributes;
with Sax.Symbols;
with Sax.Utils;
with Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;

package AdaFeed is
	package SR renames Sax.Readers;
	package UC renames Unicode.CES;
	package UB renames Ada.Strings.Unbounded;
	package IO renames Ada.Strings.Unbounded.Text_IO;

	type Reader is new Sax.Readers.Sax_Reader with record
		Current_Pref	: UB.Unbounded_String;
		Current_Value	: UB.Unbounded_String;
		Current_Element	: UB.Unbounded_String;
		In_Item		: Boolean := False;
		In_Title	: Boolean := False;
	end record;

	procedure Start_Element
		(Handler	: in out Reader;
		 NS		: Sax.Utils.XML_NS;
		 Local_Name	: Sax.Symbols.Symbol;
		 Atts		: SR.Sax_Attribute_List);

	procedure End_Element
		(Handler	: in out Reader;
		 NS		: Sax.Utils.XML_NS;
		 Local_Name	: Sax.Symbols.Symbol);

	procedure Characters
		(Handler	: in out Reader;
		 Ch		: UC.Byte_Sequence);
end AdaFeed;
