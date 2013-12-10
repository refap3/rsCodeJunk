<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Enrollments.aspx.cs" Inherits="WAfromDB.Enrollments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:TemplateField HeaderText="CourseID" SortExpression="CourseID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="CourseSqlDataSource" DataTextField="Title" DataValueField="Id" SelectedValue='<%# Bind("CourseID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="CourseSqlDataSource" DataTextField="Title" DataValueField="Id" Enabled="False" SelectedValue='<%# Bind("CourseID") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="StudentID" SortExpression="StudentID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="StudentSqlDataSource" DataTextField="LastName" DataValueField="Id" SelectedValue='<%# Bind("StudentID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="StudentSqlDataSource" DataTextField="LastName" DataValueField="Id" Enabled="False" SelectedValue='<%# Bind("StudentID") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
        </Columns>
    </asp:GridView>
    <br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Enrollment] WHERE [Id] = @original_Id AND [CourseID] = @original_CourseID AND [StudentID] = @original_StudentID AND (([Grade] = @original_Grade) OR ([Grade] IS NULL AND @original_Grade IS NULL))" InsertCommand="INSERT INTO [Enrollment] ([CourseID], [StudentID], [Grade]) VALUES (@CourseID, @StudentID, @Grade)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Enrollment]" UpdateCommand="UPDATE [Enrollment] SET [CourseID] = @CourseID, [StudentID] = @StudentID, [Grade] = @Grade WHERE [Id] = @original_Id AND [CourseID] = @original_CourseID AND [StudentID] = @original_StudentID AND (([Grade] = @original_Grade) OR ([Grade] IS NULL AND @original_Grade IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_CourseID" Type="Int32" />
        <asp:Parameter Name="original_StudentID" Type="Int32" />
        <asp:Parameter Name="original_Grade" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CourseID" Type="Int32" />
        <asp:Parameter Name="StudentID" Type="Int32" />
        <asp:Parameter Name="Grade" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CourseID" Type="Int32" />
        <asp:Parameter Name="StudentID" Type="Int32" />
        <asp:Parameter Name="Grade" Type="Int32" />
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_CourseID" Type="Int32" />
        <asp:Parameter Name="original_StudentID" Type="Int32" />
        <asp:Parameter Name="original_Grade" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="StudentSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="CourseSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Course]"></asp:SqlDataSource>
    <br />
    New:<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
    <Fields>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:TemplateField HeaderText="CourseID" SortExpression="CourseID">
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="CourseSqlDataSource" DataTextField="Title" DataValueField="Id" SelectedValue='<%# Bind("CourseID") %>'>
                </asp:DropDownList>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="CourseSqlDataSource" DataTextField="Title" DataValueField="Id" Enabled="False" SelectedValue='<%# Bind("CourseID") %>'>
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="StudentID" SortExpression="StudentID">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StudentID") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="StudentSqlDataSource" DataTextField="LastName" DataValueField="Id" SelectedValue='<%# Bind("StudentID") %>'>
                </asp:DropDownList>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="StudentSqlDataSource" DataTextField="LastName" DataValueField="Id" Enabled="False" SelectedValue='<%# Bind("StudentID") %>'>
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
        <asp:CommandField ShowInsertButton="True" />
    </Fields>
</asp:DetailsView>
<br />
</asp:Content>
