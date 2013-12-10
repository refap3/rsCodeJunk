<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="WAfromDB.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
        <asp:BoundField DataField="Credits" HeaderText="Credits" SortExpression="Credits" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Course] WHERE [Id] = @original_Id AND [Title] = @original_Title AND (([Credits] = @original_Credits) OR ([Credits] IS NULL AND @original_Credits IS NULL))" InsertCommand="INSERT INTO [Course] ([Title], [Credits]) VALUES (@Title, @Credits)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Course]" UpdateCommand="UPDATE [Course] SET [Title] = @Title, [Credits] = @Credits WHERE [Id] = @original_Id AND [Title] = @original_Title AND (([Credits] = @original_Credits) OR ([Credits] IS NULL AND @original_Credits IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_Title" Type="String" />
        <asp:Parameter Name="original_Credits" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Credits" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Credits" Type="Int32" />
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_Title" Type="String" />
        <asp:Parameter Name="original_Credits" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
    <Fields>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
        <asp:BoundField DataField="Credits" HeaderText="Credits" SortExpression="Credits" />
        <asp:CommandField ShowInsertButton="True" />
    </Fields>
</asp:DetailsView>
</asp:Content>
