<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FixOracle.Net.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" >
        <div style="text-align: center">
            Upload a TableAdapter C# file to fix :&nbsp;
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </div>
        <div style="text-align: center">
            <asp:Label ID="errorLabel" runat="server"></asp:Label>
        </div>
        <div style="text-align: center; padding-top:20px;">
            <asp:CheckBox style="padding-right: 20px; " ID="publicCommands" runat="server" Checked="true" Text="Make Commands Public"/>
            <asp:CheckBox style="padding-right: 20px; " ID="fixCasts" runat="server" Checked="true" Text="Fix casts"/>
            <asp:CheckBox ID="fixNullChecks" runat="server" Checked="true" Text="Fix null checks"/>
        </div>
        <div class="center">
            <asp:Button ID="Button1" runat="server"
                Text="Fix it!" OnClick="UploadFile" Width="80"/>
        </div>
        <div class="center">
            <asp:HyperLink runat="server" NavigateUrl="~/WebForm2.aspx">What is this?</asp:HyperLink>
        </div>
        <div class="center">
            <asp:HyperLink runat="server" NavigateUrl="~/WebForm3.aspx">Download</asp:HyperLink>
        </div>
        <div class="footer">
            <asp:HyperLink runat="server" NavigateUrl="http://www.ncodeit.com">nCode I.T. Limited</asp:HyperLink>
        </div>
    </asp:Panel>
</asp:Content>
