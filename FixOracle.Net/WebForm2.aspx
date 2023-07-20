<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="FixOracle.Net.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>What is this?</h1>

Well, if you've ever dragged a table, a stored procedure or a function from the server explorer to a dataset design surface you'll know.
This tool fixes the broken code that Oracle Developer tools (ODT) generates. If you've ever had an invalid cast exception, you need this tool.

<h2>Ok, so I'm getting invalid cast exceptions what's the real problem?</h2>
The problem is you're stuck using Oracle. If it was down to you, you'd be thinking about moving to something that plays well with ADO.Net. Unfortunately 
you're the puppet, not the puppet master, and you're forced into touching Oracle's nasty, unclean tools. Instead you're left with a bad taste 
in your mouth and a irrepressible urge to go out into the car park and decapitate yourself in a fit of depression. I feel your pain.
<h2>Enough. What's the REAL problem?</h2>
The issue is that the ODT generates a check for each out parameter to test against null, both object null and the DBNull value.
the trouble is that if an out parameter is nullable both of these checks fail. The Oracle client always returns an OracleParameter whose value 
is of the type Oracle&lt;type&gt; so checking this object against null is always false, which causes the code to execute the block which attempts to 
 transfer the value to the *actual* .net parameter, of course failing because the underlying type IS actually null.
The next problem is actually with the assignment statement - which is now always getting executed. Each OracleParameter's 
Value holds an Oracle type such as OracleDecimal or OracleString. All these types have an explicit cast operator, however, 
the code generated attempts to cast to the out parameters .Net type. The compiler doesn't understand how to convert an Object that's an 
OracleDecimal into a .net decimal type, so throws an invalid cast exception. All that is needed in this case is to cast to the 
parameters real Oracle type first, and then let the types cast operator take over for the cast to the .Net type.

<h2>What's the deal with Making Commands Public?</h2>
This fixes an inconvenience. If you want to modify the command in anyway, for example change the connection string you'll find that the commands are burried deep inside the generated code.
Well, ok, not burried, and they're not really deep, but they are <strong>protected</strong>. This means that the only way
to get at those commands to modify them on the fly would be to either implement a partial class and add the functionality there, or derive a class so
that you have access to the Table Adapters command collection. Since this tool is already scanning over the source, it has the
ability to change the protected command array to public. Just looking at the number of people searching for a solution to modifying the commands made this a worthwhile fix.
Ok, OO purists can complain that it breaks the encapsulation yada yada yada, but its somtimes better to do that than start cluttering up your project with extra classes
just so you can gain access to a single property. After all, less code = less bugs.

<h2>Wow, this is great! Where do I send the cheque?</h2>
For you, my friend, no charge. However, google made adverts for a reason, and the web hosting doesn't pay for itself. If you catch my drift.

<h2>Hmm...If only we could automate this!</h2>
You can. The web tool is great for a one off fix, or for existing code that's been broken by an upgrade, but to steal the bumper sticker, 
<strong>real</strong> programmers do it automatically. There's a Winform based client and a command line based version of the tool which you can add 
as a post build step to any project. Both tools recurse folders and can fix an entire heirarchy of broken table adapters in one go. Lucky you.

</asp:Content>
