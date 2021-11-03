with Sax.Readers;
with Unicode.CES;
with Sax.Attributes;
with Sax.Symbols;	use Sax.Symbols;
with Sax.Utils;
with Ada.Strings.Unbounded;
with Ada.Text_IO;

package body AdaFeed is
	procedure Start_Element
		(Handler	: in out Reader;
		 NS		: Sax.Utils.XML_NS;
		 Local_Name	: Sax.Symbols.Symbol;
		 Atts		: SR.Sax_Attribute_List)
	is
	begin
		if Local_Name = "item" then
			Handler.In_Item := True;
		elsif Local_Name = "title" then
			Handler.In_Title := True;
		end if;
	end Start_Element;

	procedure End_Element
		(Handler	: in out Reader;
		 NS		: Sax.Utils.XML_NS;
		 Local_Name	: Sax.Symbols.Symbol)
	is
	begin
		if Local_Name = "item" then
			Handler.In_Item := False;
		elsif Local_Name = "title" then
			if Handler.In_Item then
				IO.Put_Line (Handler.Current_Value);
			end if;
			Handler.In_Title := False;
			Handler.Current_Value := UB.Null_Unbounded_String;
		end if;
	end End_Element;

	procedure Characters
		(Handler	: in out Reader;
		 Ch		: UC.Byte_Sequence)
	is
	begin
		if Handler.In_Item and Handler.In_Title then
			Handler.Current_Value := UB."&" (Handler.Current_Value, Ch);
		end if;
	end Characters;
end AdaFeed;
