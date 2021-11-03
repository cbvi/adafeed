with Sax.Readers;	use Sax.Readers;
with Unicode.CES;
with Sax.Attributes;
with Ada.Strings.Unbounded;
with Ada.Text_IO;

package body AdaFeed is
	procedure Start_Element
		(Handler	: in out Reader;
		 Namespace_URI	: UC.Byte_Sequence := "";
		 Local_Name	: UC.Byte_Sequence := "";
		 Qname		: UC.Byte_Sequence := "";
		 Atts		: Sax.Attributes.Attributes'Class)
	is
	begin
		if Local_Name = "title" then
			Handler.Current_Element := UB.To_Unbounded_String (Local_Name);
		end if;
	end Start_Element;

	procedure End_Element
		(Handler	: in out Reader;
		 Namespace_URI	: UC.Byte_Sequence := "";
		 Local_Name	: UC.Byte_Sequence := "";
		 Qname		: UC.Byte_Sequence := "")
	is
	begin
		if UB."=" (Handler.Current_Element, "title") then
			IO.Put_Line (Handler.Current_Value);
			Handler.Current_Element := UB.Null_Unbounded_String;
			Handler.Current_Value := UB.Null_Unbounded_String;
		end if;
	end End_Element;

	procedure Characters
		(Handler	: in out Reader;
		 Ch		: UC.Byte_Sequence)
	is
	begin
		if UB."=" (Handler.Current_Element, "title") then
			Handler.Current_Value := UB."&" (Handler.Current_Value, Ch);
		end if;
	end Characters;
end AdaFeed;
