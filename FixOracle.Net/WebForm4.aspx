<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="FixOracle.Net.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">
    function dised() {
        var ed = document.getElementById("<% =txt1.ClientID %>");
        var ck = document.getElementById("<% =chk1.ClientID %>");
        ed.disabled = !ck.checked;
    }
</script>

    <asp:CheckBox ID="chk1" runat="server" Text="Check me... NOW" style="padding-right:30px" />
    <asp:TextBox ID="txt1" runat="server" Enabled="false"></asp:TextBox>
    

</asp:Content>
